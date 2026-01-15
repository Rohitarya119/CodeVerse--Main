package com.codeverse.config;

import com.codeverse.entity.Problem;
import com.codeverse.entity.TestCase;
import com.codeverse.repository.ProblemRepository;
import com.codeverse.repository.TestCaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Component
public class ReverseArraySeeder implements CommandLineRunner {

    private final ProblemRepository problemRepository;
    private final TestCaseRepository testCaseRepository;

    @Autowired
    public ReverseArraySeeder(ProblemRepository problemRepository, TestCaseRepository testCaseRepository) {
        this.problemRepository = problemRepository;
        this.testCaseRepository = testCaseRepository;
    }

    @Override
    @Transactional
    public void run(String... args) {
        problemRepository.findById(2).ifPresent(problem -> {
            List<TestCase> existing = problem.getTestCases();
            if (existing == null || existing.isEmpty()) {
                List<TestCase> tcs = new ArrayList<>();
                tcs.add(make(problem, "{\"nums\": [1, 2, 3, 4]}", "[4, 3, 2, 1]"));
                tcs.add(make(problem, "{\"nums\": [5]}", "[5]"));
                tcs.add(make(problem, "{\"nums\": []}", "[]"));
                tcs.add(make(problem, "{\"nums\": [1, 2]}", "[2, 1]"));
                testCaseRepository.saveAll(tcs);
            }

            if (problem.getExamples() == null || problem.getExamples().isEmpty()) {
                List<java.util.Map<String, String>> examples = new java.util.ArrayList<>();
                examples.add(java.util.Map.of(
                        "input", "nums = [1,2,3,4]",
                        "output", "[4,3,2,1]",
                        "explanation", "Reverse order of elements."
                ));
                examples.add(java.util.Map.of(
                        "input", "nums = [5]",
                        "output", "[5]",
                        "explanation", "Single element remains the same."
                ));
                problem.setExamples(examples);
            }

            if (problem.getConstraints() == null || problem.getConstraints().isEmpty()) {
                problem.setConstraints(java.util.List.of(
                        "1 <= nums.length <= 10^5",
                        "-10^9 <= nums[i] <= 10^9"
                ));
            }

            if (problem.getHints() == null || problem.getHints().isEmpty()) {
                problem.setHints(java.util.List.of(
                        "Use two pointers: swap from both ends",
                        "In-place reversal O(1) extra space",
                        "Built-in reverse if allowed"
                ));
            }

            if (problem.getTopics() == null || problem.getTopics().isEmpty()) {
                problem.setTopics(java.util.List.of("Arrays", "Two Pointers"));
            }

            problemRepository.save(problem);
        });
    }

    private TestCase make(Problem problem, String input, String expected) {
        TestCase tc = new TestCase();
        tc.setProblem(problem);
        tc.setInput(input);
        tc.setExpectedOutput(expected);
        return tc;
    }
}