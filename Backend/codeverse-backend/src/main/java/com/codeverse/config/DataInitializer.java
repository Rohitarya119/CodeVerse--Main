package com.codeverse.config;

import com.codeverse.entity.Difficulty;
import com.codeverse.entity.Problem;
import com.codeverse.entity.TestCase;
import com.codeverse.repository.ProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class DataInitializer implements CommandLineRunner {

    private final ProblemRepository problemRepository;

    @Autowired
    public DataInitializer(ProblemRepository problemRepository) {
        this.problemRepository = problemRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        if (problemRepository.count() == 0) {
            System.out.println("Seeding database with Two Sum problem...");
            
            Problem twoSum = new Problem();
            twoSum.setTitle("Two Sum");
            twoSum.setDescription("Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.\n\nYou may assume that each input would have exactly one solution, and you may not use the same element twice.\n\nYou can return the answer in any order.");
            twoSum.setDifficulty(Difficulty.EASY);
            twoSum.setFunctionName("twoSum");
            twoSum.setAcceptance("49.2%");
            twoSum.setSubmissions(1000);
            twoSum.setAccepted(492);
            twoSum.setLikes(100);
            twoSum.setDislikes(5);
            
            twoSum.setBoilerplateCode(java.util.Map.of(
                "java", "class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        \n    }\n}",
                "python", "class Solution:\n    def twoSum(self, nums: List[int], target: int) -> List[int]:\n        pass",
                "javascript", "/**\n * @param {number[]} nums\n * @param {number} target\n * @return {number[]}\n */\nvar twoSum = function(nums, target) {\n    \n};",
                "cpp", "class Solution {\npublic:\n    vector<int> twoSum(vector<int>& nums, int target) {\n        \n    }\n};"
            ));

            twoSum.setExamples(java.util.List.of(
                java.util.Map.of("input", "nums = [2,7,11,15], target = 9", "output", "[0,1]", "explanation", "Because nums[0] + nums[1] == 9, we return [0, 1]."),
                java.util.Map.of("input", "nums = [3,2,4], target = 6", "output", "[1,2]")
            ));
            
            twoSum.setConstraints(java.util.List.of(
                "2 <= nums.length <= 10^4", 
                "-10^9 <= nums[i] <= 10^9", 
                "-10^9 <= target <= 10^9"
            ));
            
            twoSum.setHints(java.util.List.of("A really brute force way would be to search for all possible pairs of numbers but that would be slow.", "Can we use additional space to somehow accelerate the search? I.e. a hash map."));
            twoSum.setTopics(java.util.List.of("Array", "Hash Table"));
            twoSum.setSimilarQuestions(java.util.List.of("3Sum", "4Sum"));

            List<TestCase> testCases = new ArrayList<>();
            
            TestCase tc1 = new TestCase();
            tc1.setProblem(twoSum);
            tc1.setInput("{\"nums\": [2, 7, 11, 15], \"target\": 9}");
            tc1.setExpectedOutput("[0, 1]");
            testCases.add(tc1);

            TestCase tc2 = new TestCase();
            tc2.setProblem(twoSum);
            tc2.setInput("{\"nums\": [3, 2, 4], \"target\": 6}");
            tc2.setExpectedOutput("[1, 2]");
            testCases.add(tc2);

            twoSum.setTestCases(testCases);

            problemRepository.save(twoSum);
            System.out.println("Seeding completed.");
        }
    }
}