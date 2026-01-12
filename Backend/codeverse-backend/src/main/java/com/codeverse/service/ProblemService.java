package com.codeverse.service;

import com.codeverse.entity.Problem;
import com.codeverse.entity.User;
import com.codeverse.entity.UserSolvedProblem;
import com.codeverse.repository.ProblemRepository;
import com.codeverse.repository.UserRepository;
import com.codeverse.repository.UserSolvedProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;
import java.util.Optional;
import java.time.LocalDateTime;

@Service
public class ProblemService {

    private final ProblemRepository problemRepository;
    private final UserSolvedProblemRepository userSolvedProblemRepository;
    private final UserRepository userRepository;

    @Autowired
    public ProblemService(ProblemRepository problemRepository, UserSolvedProblemRepository userSolvedProblemRepository,
            UserRepository userRepository) {
        this.problemRepository = problemRepository;
        this.userSolvedProblemRepository = userSolvedProblemRepository;
        this.userRepository = userRepository;
    }

    public List<Problem> findAll() {
        return problemRepository.findAll();
    }

    public Optional<Problem> findById(Integer id) {
        return problemRepository.findById(id);
    }

    public Problem save(Problem problem) {
        if (problem.getTestCases() != null) {
            problem.getTestCases().forEach(tc -> tc.setProblem(problem));
        }
        return problemRepository.save(problem);
    }

    public Optional<com.codeverse.dto.response.ApiResponse> updateSubmissionStats(Integer id, boolean passed) {
        return problemRepository.findById(id).map(problem -> {
            Integer submissions = problem.getSubmissions() == null ? 0 : problem.getSubmissions();
            Integer accepted = problem.getAccepted() == null ? 0 : problem.getAccepted();
            problem.setSubmissions(submissions + 1);
            if (passed) {
                problem.setAccepted(accepted + 1);
                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                if (auth != null && auth.isAuthenticated()) {
                    String principal = auth.getName();
                    Optional<User> userOpt = userRepository.findByUsernameOrEmail(principal, principal);
                    if (userOpt.isPresent()) {
                        User user = userOpt.get();
                        boolean exists = userSolvedProblemRepository.existsByUserIdAndProblemId(user.getId(),
                                problem.getId().longValue());
                        if (!exists) {
                            UserSolvedProblem usp = new UserSolvedProblem();
                            usp.setUser(user);
                            usp.setProblem(problem);
                            usp.setSolvedAt(LocalDateTime.now());
                            userSolvedProblemRepository.save(usp);
                        }
                    }
                }
            }
            problemRepository.save(problem);
            return new com.codeverse.dto.response.ApiResponse(true, passed ? "Accepted" : "Wrong Answer");
        });
    }
}