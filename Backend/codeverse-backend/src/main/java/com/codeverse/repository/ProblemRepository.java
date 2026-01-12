package com.codeverse.repository;

import com.codeverse.entity.Problem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProblemRepository extends JpaRepository<Problem, Integer> {

    @Query(value = "SELECT t as topic, COUNT(*) as count FROM problems p, jsonb_array_elements_text(p.topics) t GROUP BY t", nativeQuery = true)
    List<Object[]> findTopicCounts();
}