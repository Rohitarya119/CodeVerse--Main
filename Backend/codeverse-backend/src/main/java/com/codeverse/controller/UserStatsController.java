package com.codeverse.controller;

import com.codeverse.entity.Difficulty;
import com.codeverse.entity.User;
import com.codeverse.repository.UserRepository;
import com.codeverse.repository.UserSolvedProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/users/me")
@CrossOrigin(origins = "http://localhost:5173")
public class UserStatsController {

    private final UserSolvedProblemRepository userSolvedProblemRepository;
    private final UserRepository userRepository;

    @Autowired
    public UserStatsController(UserSolvedProblemRepository userSolvedProblemRepository, UserRepository userRepository) {
        this.userSolvedProblemRepository = userSolvedProblemRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/stats")
    public ResponseEntity<?> getStats() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated()) {
            return ResponseEntity.status(401).build();
        }
        String principal = auth.getName();
        Optional<User> userOpt = userRepository.findByUsernameOrEmail(principal, principal);
        if (userOpt.isEmpty()) {
            return ResponseEntity.status(404).build();
        }
        Long userId = userOpt.get().getId();
        long totalSolved = userSolvedProblemRepository.countByUser_Id(userId);
        long easySolved = userSolvedProblemRepository.countByUserIdAndDifficulty(userId, Difficulty.EASY);
        long mediumSolved = userSolvedProblemRepository.countByUserIdAndDifficulty(userId, Difficulty.MEDIUM);
        long hardSolved = userSolvedProblemRepository.countByUserIdAndDifficulty(userId, Difficulty.HARD);
        Map<String, Long> stats = new HashMap<>();
        stats.put("totalSolved", totalSolved);
        stats.put("easySolved", easySolved);
        stats.put("mediumSolved", mediumSolved);
        stats.put("hardSolved", hardSolved);
        return ResponseEntity.ok(stats);
    }

    @GetMapping("/solved")
    public ResponseEntity<?> getSolvedProblemIds() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated()) {
            return ResponseEntity.status(401).build();
        }
        String principal = auth.getName();
        Optional<User> userOpt = userRepository.findByUsernameOrEmail(principal, principal);
        if (userOpt.isEmpty()) {
            return ResponseEntity.status(404).build();
        }
        Long userId = userOpt.get().getId();
        java.util.List<Integer> ids = userSolvedProblemRepository.findSolvedProblemIdsByUserId(userId);
        return ResponseEntity.ok(ids);
    }
}