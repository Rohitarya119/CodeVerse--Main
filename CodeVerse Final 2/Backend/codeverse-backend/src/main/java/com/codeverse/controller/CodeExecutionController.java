package com.codeverse.controller;

import com.codeverse.dto.request.CodeExecutionRequest;
import com.codeverse.dto.response.CodeExecutionResponse;
import com.codeverse.service.CodeExecutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/execute")
@CrossOrigin(origins = "http://localhost:5173")
public class CodeExecutionController {

    private final CodeExecutionService codeExecutionService;

    @Autowired
    public CodeExecutionController(CodeExecutionService codeExecutionService) {
        this.codeExecutionService = codeExecutionService;
    }

    @PostMapping
    public ResponseEntity<CodeExecutionResponse> executeCode(@RequestBody java.util.Map<String, Object> body) {
        String code = (String) body.get("code");
        String language = (String) body.get("language");
        String stdin = (String) body.get("stdin");

        System.out.println("Received execution request: " + language);

        CodeExecutionResponse response = codeExecutionService.executeCode(code, language, stdin);

        // Always return 200 OK so the frontend can display the output/error
        // The 'error' field in the response will contain the compilation/runtime error
        // if any
        return ResponseEntity.ok(response);
    }
}