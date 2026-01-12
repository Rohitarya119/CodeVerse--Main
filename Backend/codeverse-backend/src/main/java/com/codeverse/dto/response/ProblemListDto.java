package com.codeverse.dto.response;

import java.util.List;

/**
 * Lightweight DTO for problem listings. Excludes heavy fields like
 * description, examples, constraints, hints, testCases, and boilerplateCode
 * to improve API performance when listing many problems.
 */
public class ProblemListDto {
    private Integer id;
    private String title;
    private String difficulty;
    private List<String> topics;
    private Integer submissions;
    private Integer accepted;
    private Double acceptance;
    private Integer likes;
    private Integer dislikes;
    private List<String> companies;
    private Integer frequency;
    private String functionName;

    public ProblemListDto() {
    }

    public ProblemListDto(Integer id, String title, String difficulty, List<String> topics,
            Integer submissions, Integer accepted, Double acceptance, String functionName,
            List<String> companies, Integer frequency, Integer likes, Integer dislikes) {
        this.id = id;
        this.title = title;
        this.difficulty = difficulty;
        this.topics = topics;
        this.submissions = submissions;
        this.accepted = accepted;
        this.acceptance = acceptance;
        this.functionName = functionName;
        this.companies = companies;
        this.frequency = frequency;
        this.likes = likes;
        this.dislikes = dislikes;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public List<String> getTopics() {
        return topics;
    }

    public void setTopics(List<String> topics) {
        this.topics = topics;
    }

    public Integer getSubmissions() {
        return submissions;
    }

    public void setSubmissions(Integer submissions) {
        this.submissions = submissions;
    }

    public Integer getAccepted() {
        return accepted;
    }

    public void setAccepted(Integer accepted) {
        this.accepted = accepted;
    }

    public Double getAcceptance() {
        return acceptance;
    }

    public void setAcceptance(Double acceptance) {
        this.acceptance = acceptance;
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    public Integer getDislikes() {
        return dislikes;
    }

    public void setDislikes(Integer dislikes) {
        this.dislikes = dislikes;
    }

    public List<String> getCompanies() {
        return companies;
    }

    public void setCompanies(List<String> companies) {
        this.companies = companies;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }
}
