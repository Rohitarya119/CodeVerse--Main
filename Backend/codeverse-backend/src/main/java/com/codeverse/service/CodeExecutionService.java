package com.codeverse.service;

import com.codeverse.dto.response.CodeExecutionResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import java.util.Map;
import java.util.HashMap;

@Service
public class CodeExecutionService {

    private final RestTemplate restTemplate = new RestTemplate();
    @org.springframework.beans.factory.annotation.Value("${codeverse.executor.url:http://localhost:3000/execute}")
    private String executionServerUrl;

    public CodeExecutionResponse executeCode(String code, String language, String stdin) {
        CodeExecutionResponse response = new CodeExecutionResponse();

        try {
            // Prepare request to code execution server
            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("code", code);
            requestBody.put("language", language != null ? language : "javascript");
            requestBody.put("stdin", stdin != null ? stdin : "");

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(requestBody, headers);

            // Call code execution server
            ResponseEntity<Map> result = restTemplate.exchange(
                    executionServerUrl,
                    HttpMethod.POST,
                    entity,
                    Map.class);

            Map<String, Object> resultBody = result.getBody();
            if (resultBody != null) {
                response.setOutput((String) resultBody.get("output"));
                response.setError((String) resultBody.get("error"));
            }

        } catch (Exception e) {
            response.setError("Code execution server error: " + e.getMessage());
        }
        return response;
    }
}