package com.example.aop.core;

import java.io.Serial;
import java.io.Serializable;

/**
 *
 * @author yanni
 */
public class Passport implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    private long userId = 0L;
    private String token = "";

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "Passport{" +
                "userId=" + userId +
                ", token='" + token + '\'' +
                '}';
    }
}
