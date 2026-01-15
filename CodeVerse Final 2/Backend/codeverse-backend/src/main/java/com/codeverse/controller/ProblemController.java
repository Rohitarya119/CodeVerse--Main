package com.codeverse.controller;

import com.codeverse.entity.Problem;
import com.codeverse.entity.TestCase;
import com.codeverse.entity.User;
import com.codeverse.entity.UserSolvedProblem;
import com.codeverse.service.ProblemService;
import com.codeverse.service.CodeExecutionService;
import com.codeverse.dto.response.CodeExecutionResponse;
import com.codeverse.repository.UserRepository;
import com.codeverse.repository.UserSolvedProblemRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.time.LocalDateTime;
import java.util.Arrays;

@RestController
@RequestMapping("/api/problems")
@CrossOrigin(origins = "http://localhost:5173")
public class ProblemController {

    private static final Logger logger = LoggerFactory.getLogger(ProblemController.class);
    private final ProblemService problemService;
    private final CodeExecutionService codeExecutionService;
    private final UserRepository userRepository;
    private final UserSolvedProblemRepository userSolvedProblemRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Autowired
    public ProblemController(ProblemService problemService, CodeExecutionService codeExecutionService,
            UserRepository userRepository, UserSolvedProblemRepository userSolvedProblemRepository) {
        this.problemService = problemService;
        this.codeExecutionService = codeExecutionService;
        this.userRepository = userRepository;
        this.userSolvedProblemRepository = userSolvedProblemRepository;
    }

    @GetMapping
    public List<Problem> getAllProblems() {
        return problemService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Problem> getProblemById(@PathVariable Integer id) {
        return problemService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Problem> createProblem(@RequestBody Problem problem) {
        return ResponseEntity.ok(problemService.save(problem));
    }

    @PostMapping("/{id}/submission")
    public ResponseEntity<?> updateSubmission(@PathVariable Integer id,
            @RequestBody java.util.Map<String, Boolean> body) {
        boolean passed = Boolean.TRUE.equals(body.get("passed"));
        return problemService.updateSubmissionStats(id, passed)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping("/{id}/run")
    public ResponseEntity<?> runSingleTest(@PathVariable Integer id, @RequestBody Map<String, String> body) {
        try {
            Problem problem = problemService.findById(id).orElse(null);
            if (problem == null) {
                return ResponseEntity.notFound().build();
            }

            String code = body.get("code");
            String language = body.get("language");
            String stdin = body.get("stdin");

            logger.info("Running single test for problem {}. Language: {}", id, language);

            String finalCode = code;
            String testCasesJson = "[" + stdin + "]";

            String functionName = problem.getFunctionName();
            if (functionName == null || functionName.isEmpty()) {
                functionName = "solve";
            }

            if ("python".equalsIgnoreCase(language)) {
                String imports = "import sys, json\nfrom typing import List\n\n";
                String driver = "if __name__ == '__main__':\n" +
                        "    try:\n" +
                        "        test_cases = json.loads(sys.stdin.read())\n" +
                        "        sol = Solution()\n" +
                        "        results = []\n" +
                        "        for tc in test_cases:\n" +
                        "            result = sol." + functionName + "(**tc)\n" +
                        "            if result is None:\n" +
                        "                results.append(list(tc.values())[0])\n" +
                        "            else:\n" +
                        "                results.append(result)\n" +
                        "        print(json.dumps(results))\n" +
                        "    except Exception as e:\n" +
                        "        print(str(e), file=sys.stderr)\n";
                finalCode = imports + code + "\n\n" + driver;
            } else if ("javascript".equalsIgnoreCase(language)) {
                finalCode += "\n\n" +
                        "const fs = require('fs');\n" +
                        "try {\n" +
                        "    const input = fs.readFileSync(0, 'utf-8');\n" +
                        "    if (input) {\n" +
                        "        const testCases = JSON.parse(input);\n" +
                        "        const results = testCases.map(tc => {\n" +
                        "            const args = Object.values(tc);\n" +
                        "            const res = " + functionName + "(...args);\n" +
                        "            return res === undefined ? args[0] : res;\n" +
                        "        });\n" +
                        "        console.log(JSON.stringify(results));\n" +
                        "    }\n" +
                        "} catch (e) {\n" +
                        "    console.error(e.message);\n" +
                        "}\n";
                } else if ("java".equalsIgnoreCase(language)) {
                    // Parse the single test case from stdin
                    List<Map<String, Object>> testCases = objectMapper.readValue(testCasesJson, List.class);
                    finalCode = generateJavaDriverCode(code, testCases, functionName);
                } else if ("cpp".equalsIgnoreCase(language) || "c++".equalsIgnoreCase(language)) {
                    List<Map<String, Object>> testCases = objectMapper.readValue(testCasesJson, List.class);
                    finalCode = generateCppDriverCode(code, testCases, functionName);
                }

            CodeExecutionResponse execResponse = codeExecutionService.executeCode(
                    finalCode,
                    language,
                    testCasesJson);

            String stdout = execResponse.getOutput();
            String stderr = execResponse.getError();

            Map<String, Object> result = new HashMap<>();
            result.put("stdout", "");
            result.put("stderr", "");

            if (stderr != null && !stderr.isEmpty()) {
                result.put("stderr", stderr.trim());
            } else if (stdout != null && !stdout.isEmpty()) {
                try {
                    java.util.List<Object> outputResults = objectMapper.readValue(stdout.trim(), java.util.List.class);
                    if (!outputResults.isEmpty()) {
                        result.put("stdout", objectMapper.writeValueAsString(outputResults.get(0)));
                    }
                } catch (Exception e) {
                    result.put("stdout", stdout.trim());
                }
            }

            return ResponseEntity.ok(result);

        } catch (Exception e) {
            logger.error("Error running single test", e);
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.ok(error);
        }
    }

    @PostMapping("/{id}/execute")
    public ResponseEntity<?> runAllTests(@PathVariable Integer id, @RequestBody Map<String, String> body) {
        try {
            Problem problem = problemService.findById(id).orElse(null);
            if (problem == null) {
                return ResponseEntity.notFound().build();
            }

            String code = body.get("code");
            String language = body.get("language");
            List<TestCase> testCases = problem.getTestCases();
            List<Map<String, Object>> results = new ArrayList<>();

            logger.info("Running all tests for problem {}. Language: {}", id, language);

            try {
                String finalCode = code;
                StringBuilder testCasesJson = new StringBuilder("[");
                List<Map<String, Object>> parsedTestCases = new ArrayList<>();

                for (int i = 0; i < testCases.size(); i++) {
                    if (i > 0) testCasesJson.append(",");
                    String input = testCases.get(i).getInput();
                    testCasesJson.append(input);
                    parsedTestCases.add(objectMapper.readValue(input, Map.class));
                }
                testCasesJson.append("]");

                String functionName = problem.getFunctionName();
                if (functionName == null || functionName.isEmpty()) {
                    functionName = "solve";
                }

                if ("python".equalsIgnoreCase(language)) {
                    String imports = "import sys, json\nfrom typing import List\n\n";
                    String driver = "if __name__ == '__main__':\n" +
                            "    try:\n" +
                            "        test_cases = json.loads(sys.stdin.read())\n" +
                            "        sol = Solution()\n" +
                            "        results = []\n" +
                            "        for tc in test_cases:\n" +
                            "            result = sol." + functionName + "(**tc)\n" +
                            "            if result is None:\n" +
                            "                results.append(list(tc.values())[0])\n" +
                            "            else:\n" +
                            "                results.append(result)\n" +
                            "        print(json.dumps(results))\n" +
                            "    except Exception as e:\n" +
                            "        print(str(e), file=sys.stderr)\n";
                    finalCode = imports + code + "\n\n" + driver;
                } else if ("javascript".equalsIgnoreCase(language)) {
                    finalCode += "\n\n" +
                            "const fs = require('fs');\n" +
                            "try {\n" +
                            "    const input = fs.readFileSync(0, 'utf-8');\n" +
                            "    if (input) {\n" +
                            "        const testCases = JSON.parse(input);\n" +
                            "        const results = testCases.map(tc => {\n" +
                            "            const args = Object.values(tc);\n" +
                            "            const res = " + functionName + "(...args);\n" +
                            "            return res === undefined ? args[0] : res;\n" +
                            "        });\n" +
                            "        console.log(JSON.stringify(results));\n" +
                            "    }\n" +
                            "} catch (e) {\n" +
                            "    console.error(e.message);\n" +
                            "}\n";
                } else if ("java".equalsIgnoreCase(language)) {
                    finalCode = generateJavaDriverCode(code, parsedTestCases, functionName);
                } else if ("cpp".equalsIgnoreCase(language) || "c++".equalsIgnoreCase(language)) {
                    finalCode = generateCppDriverCode(code, parsedTestCases, functionName);
                }

                CodeExecutionResponse execResponse = codeExecutionService.executeCode(
                        finalCode,
                        language,
                        testCasesJson.toString());

                String stdout = execResponse.getOutput();
                String stderr = execResponse.getError();

                if (stderr != null && !stderr.isEmpty()) {
                    for (TestCase testCase : testCases) {
                        Map<String, Object> result = new HashMap<>();
                        result.put("input", testCase.getInput());
                        result.put("expectedOutput", testCase.getExpectedOutput());
                        result.put("stdout", "");
                        result.put("stderr", stderr.trim());
                        result.put("passed", false);
                        results.add(result);
                    }
                } else if (stdout != null && !stdout.isEmpty()) {
                    try {
                        java.util.List<Object> outputResults = objectMapper.readValue(stdout.trim(), java.util.List.class);

                        for (int i = 0; i < testCases.size(); i++) {
                            TestCase testCase = testCases.get(i);
                            Map<String, Object> result = new HashMap<>();
                            result.put("input", testCase.getInput());
                            result.put("expectedOutput", testCase.getExpectedOutput());

                            String actualOutput = "";
                            if (i < outputResults.size()) {
                                actualOutput = objectMapper.writeValueAsString(outputResults.get(i));
                            }

                            result.put("stdout", actualOutput);
                            result.put("stderr", "");

                            String normalizedOutput = actualOutput.replaceAll("\\s+", "");
                            String normalizedExpected = testCase.getExpectedOutput().trim().replaceAll("\\s+", "");

                            boolean passed = normalizedOutput.equals(normalizedExpected);
                            result.put("passed", passed);
                            results.add(result);
                        }
                    } catch (Exception parseEx) {
                         for (TestCase testCase : testCases) {
                            Map<String, Object> result = new HashMap<>();
                            result.put("input", testCase.getInput());
                            result.put("expectedOutput", testCase.getExpectedOutput());
                            result.put("stdout", stdout.trim());
                            result.put("stderr", "Failed to parse output: " + parseEx.getMessage());
                            result.put("passed", false);
                            results.add(result);
                        }
                    }
                } else {
                    for (TestCase testCase : testCases) {
                        Map<String, Object> result = new HashMap<>();
                        result.put("input", testCase.getInput());
                        result.put("expectedOutput", testCase.getExpectedOutput());
                        result.put("stdout", "");
                        result.put("stderr", "No output received");
                        result.put("passed", false);
                        results.add(result);
                    }
                }

            } catch (Exception e) {
                logger.error("Error running all tests", e);
                for (TestCase testCase : testCases) {
                    Map<String, Object> result = new HashMap<>();
                    result.put("input", testCase.getInput());
                    result.put("expectedOutput", testCase.getExpectedOutput());
                    result.put("stdout", "");
                    result.put("stderr", "Execution error: " + e.getMessage());
                    result.put("passed", false);
                    results.add(result);
                }
            }

            Map<String, Object> response = new HashMap<>();
            response.put("results", results);

            return ResponseEntity.ok(response);

        } catch (Exception e) {
             logger.error("Error in execute endpoint", e);
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.ok(error);
        }
    }

    @PostMapping("/{id}/submit")
    public ResponseEntity<?> submitSolution(@PathVariable Integer id, @RequestBody Map<String, String> body) {
        try {
            ResponseEntity<?> testResults = runAllTests(id, body);
            if (testResults.getStatusCode().isError()) {
                return testResults;
            }

            @SuppressWarnings("unchecked")
            Map<String, Object> testData = (Map<String, Object>) testResults.getBody();
            @SuppressWarnings("unchecked")
            List<Map<String, Object>> results = (List<Map<String, Object>>) testData.get("results");

            boolean allPassed = results.stream().allMatch(r -> Boolean.TRUE.equals(r.get("passed")));

            if (allPassed) {
                problemService.updateSubmissionStats(id, true);

                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                if (auth != null && auth.isAuthenticated()) {
                    String principal = auth.getName();
                    userRepository.findByUsernameOrEmail(principal, principal).ifPresent(user -> {
                        problemService.findById(id).ifPresent(problem -> {
                            if (!userSolvedProblemRepository.existsByUserIdAndProblemId(user.getId(), id.longValue())) {
                                UserSolvedProblem solved = new UserSolvedProblem();
                                solved.setUser(user);
                                solved.setProblem(problem);
                                solved.setSolvedAt(LocalDateTime.now());
                                userSolvedProblemRepository.save(solved);
                            }
                        });
                    });
                }
            }

            Map<String, Object> response = new HashMap<>();
            response.put("passed", allPassed);
            response.put("results", results);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    private String generateJavaDriverCode(String userCode, List<Map<String, Object>> testCases, String functionName) {
        StringBuilder sb = new StringBuilder();
        
        // Import necessary classes
        sb.append("import java.util.*;\n");
        sb.append("import java.util.stream.*;\n");
        sb.append("\n");

        // Append user code (remove public from class if present to avoid file name issues)
        sb.append(userCode.replace("public class Solution", "class Solution"));
        sb.append("\n\n");
        
        sb.append("public class Main {\n");
        sb.append("    public static void main(String[] args) {\n");
        sb.append("        Solution sol = new Solution();\n");
        sb.append("        List<Object> results = new ArrayList<>();\n");
        
        // Extract parameter types and return type
        String returnType = "Object";
        Pattern methodPattern = Pattern.compile("(?:public\\s+)?(?:static\\s+)?(\\w+(?:\\[\\])?(?:<[^>]+>)?)\\s+" + functionName + "\\s*\\(");
        Matcher methodMatcher = methodPattern.matcher(userCode);
        if (methodMatcher.find()) {
            returnType = methodMatcher.group(1);
        }

        // Extract parameter types from user code
        Pattern pattern = Pattern.compile(functionName + "\\s*\\(([^)]*)\\)");
        Matcher matcher = pattern.matcher(userCode);
        
        List<String> paramNames = new ArrayList<>();
        List<String> paramTypes = new ArrayList<>();
        
        if (matcher.find()) {
            String paramsStr = matcher.group(1);
            if (!paramsStr.trim().isEmpty()) {
                String[] params = paramsStr.split(",");
                for (String param : params) {
                    String[] parts = param.trim().split("\\s+");
                    if (parts.length >= 2) {
                        paramTypes.add(parts[0]); // e.g., int[]
                        paramNames.add(parts[1]); // e.g., nums
                    }
                }
            }
        }
        
        for (Map<String, Object> tc : testCases) {
            sb.append("        try {\n");
            
            // Generate variable declarations and initializations
            List<String> callArgs = new ArrayList<>();
            for (int i = 0; i < paramNames.size(); i++) {
                String name = paramNames.get(i);
                String type = paramTypes.get(i);
                Object value = tc.get(name);
                
                String varName = name + "_" + System.nanoTime(); // unique name
                callArgs.add(varName);
                
                sb.append("            ").append(type).append(" ").append(varName).append(" = ");
                sb.append(convertToJavaLiteral(value, type)).append(";\n");
            }
            
            // Call the method
            if ("void".equals(returnType)) {
                sb.append("            sol.").append(functionName).append("(");
                sb.append(String.join(", ", callArgs));
                sb.append(");\n");
                // For void methods, assume in-place modification of the first argument
                if (!callArgs.isEmpty()) {
                    sb.append("            results.add(").append(callArgs.get(0)).append(");\n");
                } else {
                    sb.append("            results.add(\"null\");\n");
                }
            } else {
                sb.append("            Object result = sol.").append(functionName).append("(");
                sb.append(String.join(", ", callArgs));
                sb.append(");\n");
                sb.append("            results.add(result);\n");
            }
            
            sb.append("        } catch (Exception e) {\n");
            sb.append("            e.printStackTrace();\n"); // This will go to stderr
            sb.append("            results.add(null);\n");
            sb.append("        }\n");
        }
        
        // Helper method to print object as JSON
        sb.append("        printJson(results);\n");
        sb.append("    }\n");
        
        // Add printJson helper
        sb.append("    private static void printJson(List<Object> list) {\n");
        sb.append("        System.out.print(\"[\");\n");
        sb.append("        for (int i = 0; i < list.size(); i++) {\n");
        sb.append("            if (i > 0) System.out.print(\",\");\n");
        sb.append("            Object obj = list.get(i);\n");
        sb.append("            printObject(obj);\n");
        sb.append("        }\n");
        sb.append("        System.out.println(\"]\");\n");
        sb.append("    }\n\n");
        sb.append("    private static void printObject(Object obj) {\n");
        sb.append("        if (obj == null) System.out.print(\"null\");\n");
        sb.append("        else if (obj instanceof Integer || obj instanceof Boolean || obj instanceof Long || obj instanceof Double) System.out.print(obj);\n");
        sb.append("        else if (obj instanceof String) System.out.print(\"\\\"\" + obj + \"\\\"\");\n");
        sb.append("        else if (obj.getClass().isArray()) {\n");
        sb.append("            if (obj instanceof int[]) System.out.print(Arrays.toString((int[])obj));\n");
        sb.append("            else if (obj instanceof long[]) System.out.print(Arrays.toString((long[])obj));\n");
        sb.append("            else if (obj instanceof double[]) System.out.print(Arrays.toString((double[])obj));\n");
        sb.append("            else if (obj instanceof boolean[]) System.out.print(Arrays.toString((boolean[])obj));\n");
        sb.append("            else if (obj instanceof char[]) {\n");
        sb.append("                char[] chars = (char[]) obj;\n");
        sb.append("                System.out.print(\"[\");\n");
        sb.append("                for (int k = 0; k < chars.length; k++) {\n");
        sb.append("                    if (k > 0) System.out.print(\",\");\n");
        sb.append("                    System.out.print(\"\\\"\" + chars[k] + \"\\\"\");\n");
        sb.append("                }\n");
        sb.append("                System.out.print(\"]\");\n");
        sb.append("            }\n");
        sb.append("            else if (obj instanceof Object[]) {\n");
        sb.append("                Object[] arr = (Object[]) obj;\n");
        sb.append("                System.out.print(\"[\");\n");
        sb.append("                for (int k = 0; k < arr.length; k++) {\n");
        sb.append("                    if (k > 0) System.out.print(\",\");\n");
        sb.append("                    printObject(arr[k]);\n");
        sb.append("                }\n");
        sb.append("                System.out.print(\"]\");\n");
        sb.append("            }\n");
        sb.append("            else System.out.print(\"null\");\n");
        sb.append("        } else {\n");
        sb.append("            System.out.print(\"\\\"\" + obj.toString() + \"\\\"\"); // Fallback for objects to string\n");
        sb.append("        }\n");
        sb.append("    }\n");
        
        sb.append("}\n");
        
        return sb.toString();
    }
    
    private String convertToJavaLiteral(Object value, String type) {
        if (value == null) return "null";
        if (type.equals("int") || type.equals("Integer")) return value.toString();
        if (type.equals("boolean") || type.equals("Boolean")) return value.toString();
        if (type.equals("String")) return "\"" + value.toString() + "\"";
        if (type.equals("int[]")) {
            if (value instanceof List) {
                List<?> list = (List<?>) value;
                String elements = list.stream().map(Object::toString).collect(Collectors.joining(", "));
                return "new int[] {" + elements + "}";
            }
        }
        if (type.equals("char[]")) {
            if (value instanceof List) {
                List<?> list = (List<?>) value;
                String elements = list.stream()
                    .map(o -> "'" + o.toString() + "'")
                    .collect(Collectors.joining(", "));
                return "new char[] {" + elements + "}";
            }
        }
        // Add more types as needed
        return "null";
    }

    private String generateCppDriverCode(String userCode, List<Map<String, Object>> testCases, String functionName) {
        StringBuilder sb = new StringBuilder();
        
        sb.append("#include <iostream>\n");
        sb.append("#include <vector>\n");
        sb.append("#include <string>\n");
        sb.append("#include <algorithm>\n");
        sb.append("#include <map>\n");
        sb.append("#include <unordered_map>\n");
        sb.append("#include <set>\n");
        sb.append("#include <unordered_set>\n");
        sb.append("using namespace std;\n\n");
        
        // Add output helpers first
        sb.append("template <typename T> void printVal(const T& val) { cout << val; }\n");
        sb.append("void printVal(const string& val) { cout << \"\\\"\" << val << \"\\\"\"; }\n");
        sb.append("template <typename T> void printVal(const vector<T>& v) {\n");
        sb.append("    cout << \"[\";\n");
        sb.append("    for(size_t i=0; i<v.size(); ++i) {\n");
        sb.append("        if(i>0) cout << \",\";\n");
        sb.append("        printVal(v[i]);\n");
        sb.append("    }\n");
        sb.append("    cout << \"]\";\n");
        sb.append("}\n\n");

        sb.append(userCode);
        sb.append("\n\n");
        
        sb.append("int main() {\n");
        sb.append("    Solution sol;\n");
        sb.append("    cout << \"[\";\n");
        
        // Parse parameters like in Java
        String returnType = "auto"; // C++ can use auto if we don't know, but we better declaring it from user code if possible.
        // Simplified parameter extraction for C++
        Pattern pattern = Pattern.compile(functionName + "\\s*\\(([^)]*)\\)");
        Matcher matcher = pattern.matcher(userCode);
        List<String> paramNames = new ArrayList<>();
        List<String> paramTypes = new ArrayList<>();
        
        if (matcher.find()) {
            String paramsStr = matcher.group(1);
            if (!paramsStr.trim().isEmpty()) {
                String[] params = paramsStr.split(",");
                for (String param : params) {
                    // Cleaner C++ type extraction (handling references and const)
                    String p = param.trim();
                    int spaceIdx = p.lastIndexOf(' ');
                    if (spaceIdx > 0) {
                        String type = p.substring(0, spaceIdx).trim();
                        String name = p.substring(spaceIdx + 1).trim();
                        // Remove & or * from name if user put it there like "int *ptr"
                        // Actually standard is "int* ptr" or "int * ptr", so robust parsing needed
                        // But simple assumption: last token is name
                        paramTypes.add(type);
                        paramNames.add(name);
                    }
                }
            }
        }

        for (int i = 0; i < testCases.size(); i++) {
            Map<String, Object> tc = testCases.get(i);
            if (i > 0) sb.append("    cout << \",\";\n");
            
            sb.append("    {\n");
            List<String> callArgs = new ArrayList<>();
            for (int j = 0; j < paramNames.size(); j++) {
                String name = paramNames.get(j);
                // Clean type for declaration (remove const, &)
                String rawType = paramTypes.get(j).replace("const", "").replace("&", "").trim();
                Object value = tc.get(name);
                
                sb.append("        ").append(rawType).append(" ").append(name).append(" = ");
                sb.append(convertToCppLiteral(value, rawType)).append(";\n");
                callArgs.add(name);
            }
            
            sb.append("        printVal(sol.").append(functionName).append("(");
            sb.append(String.join(", ", callArgs));
            sb.append("));\n");
            
            sb.append("    }\n");
        }
        
        sb.append("    cout << \"]\" << endl;\n");
        sb.append("    return 0;\n");
        sb.append("}\n");
        
        return sb.toString();
    }
    
    private String convertToCppLiteral(Object value, String type) {
        if (value == null) return "0"; // or custom null
        if (type.contains("vector")) {
            if (value instanceof List) {
                List<?> list = (List<?>) value;
                String elements = list.stream().map(Object::toString).collect(Collectors.joining(", "));
                return "{" + elements + "}";
            }
        }
        if (type.equals("string") || type.equals("std::string")) return "\"" + value.toString() + "\"";
        if (type.equals("bool")) return value.toString().toLowerCase(); // true/false
        return value.toString();
    }
}