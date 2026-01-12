package com.codeverse.repository;

import com.codeverse.entity.Difficulty;
import com.codeverse.entity.UserSolvedProblem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserSolvedProblemRepository extends JpaRepository<UserSolvedProblem, Long> {

    long countByUser_Id(Long userId);

    @Query("SELECT COUNT(usp) FROM UserSolvedProblem usp WHERE usp.user.id = :userId AND usp.problem.difficulty = :difficulty")
    long countByUserIdAndDifficulty(@Param("userId") Long userId, @Param("difficulty") Difficulty difficulty);

    @Query("SELECT usp.problem.id FROM UserSolvedProblem usp WHERE usp.user.id = :userId")
    java.util.List<Integer> findSolvedProblemIdsByUserId(@Param("userId") Long userId);

    @Query("SELECT CASE WHEN COUNT(usp) > 0 THEN true ELSE false END FROM UserSolvedProblem usp WHERE usp.user.id = :userId AND usp.problem.id = :problemId")
    boolean existsByUserIdAndProblemId(@Param("userId") Long userId, @Param("problemId") Long problemId);
}