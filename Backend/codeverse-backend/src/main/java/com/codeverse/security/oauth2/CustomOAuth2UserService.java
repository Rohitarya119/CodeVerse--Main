package com.codeverse.security.oauth2;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.core.ParameterizedTypeReference;

import java.util.List;
import java.util.Map;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User user = super.loadUser(userRequest);
        
        // If provider is GitHub and email is missing, try to fetch it
        if (userRequest.getClientRegistration().getRegistrationId().equals("github")) {
            String email = user.getAttribute("email");
            if (email == null || email.isEmpty()) {
                email = fetchGitHubEmail(userRequest.getAccessToken().getTokenValue());
                if (email != null) {
                    // Create a new mutable map or use a custom OAuth2User implementation
                    // For now, simpler to know that we need to handle this in SuccessHandler
                    // But SuccessHandler gets the OAuth2User from Authentication object.
                    // We need to enrich it here.
                    
                    // Since DefaultOAuth2User attributes are immutable, we might need a custom wrapper
                    // Or we can just attach it to a thread local or modify how we return it.
                    // A simple way is to use a CustomOAuth2User wrapper.
                    return new CustomOAuth2User(user, email);
                }
            }
        }
        
        return user;
    }

    private String fetchGitHubEmail(String accessToken) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                "https://api.github.com/user/emails",
                HttpMethod.GET,
                entity,
                new ParameterizedTypeReference<List<Map<String, Object>>>() {}
            );

            List<Map<String, Object>> emails = response.getBody();
            if (emails != null) {
                for (Map<String, Object> emailObj : emails) {
                    Boolean primary = (Boolean) emailObj.get("primary");
                    Boolean verified = (Boolean) emailObj.get("verified");
                    String email = (String) emailObj.get("email");
                    if (Boolean.TRUE.equals(primary) && Boolean.TRUE.equals(verified)) {
                        return email;
                    }
                }
                // Fallback to any verified email
                for (Map<String, Object> emailObj : emails) {
                    Boolean verified = (Boolean) emailObj.get("verified");
                    String email = (String) emailObj.get("email");
                    if (Boolean.TRUE.equals(verified)) {
                        return email;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
