package com.codeverse.entity;

import java.io.Serializable;
import java.util.Objects;

public class BattleUserId implements Serializable {
    private Long battle;
    private Long user;

    public BattleUserId() {}
    public BattleUserId(Long battle, Long user) {
        this.battle = battle;
        this.user = user;
    }

    // getters & setters
    public Long getBattle() { return battle; }
    public void setBattle(Long battle) { this.battle = battle; }
    public Long getUser() { return user; }
    public void setUser(Long user) { this.user = user; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BattleUserId that = (BattleUserId) o;
        return Objects.equals(battle, that.battle) && Objects.equals(user, that.user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(battle, user);
    }
}
