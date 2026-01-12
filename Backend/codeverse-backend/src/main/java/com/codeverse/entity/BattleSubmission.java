package com.codeverse.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "battle_submission")
public class BattleSubmission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "battle_id", nullable = false)
    private Battle battle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private String language;

    @Lob
    @Column(nullable = false)
    private String code;

    @Column(nullable = false)
    private String result; // PASS, FAIL, ERROR

    private Integer execTimeMs;

    @Lob
    private String output;

    private LocalDateTime submittedAt = LocalDateTime.now();

    // getters & setters omitted for brevity
    public Long getId() { return id; }
    public Battle getBattle() { return battle; }
    public void setBattle(Battle battle) { this.battle = battle; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getResult() { return result; }
    public void setResult(String result) { this.result = result; }
    public Integer getExecTimeMs() { return execTimeMs; }
    public void setExecTimeMs(Integer execTimeMs) { this.execTimeMs = execTimeMs; }
    public String getOutput() { return output; }
    public void setOutput(String output) { this.output = output; }
    public LocalDateTime getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(LocalDateTime submittedAt) { this.submittedAt = submittedAt; }
}
