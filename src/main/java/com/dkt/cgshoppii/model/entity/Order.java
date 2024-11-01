package com.dkt.cgshoppii.model.entity;

import java.time.LocalDateTime;
import java.util.List;

public class Order {
    private int id;
    private User user; // Many-to-One relationship with User
    private LocalDateTime createdAt;
    private double totalAmount;
    private List<OrderItem> orderItems;

    public Order () {}

    public Order(User user, LocalDateTime createdAt, double totalAmount) {
        this.user = user;
        this.createdAt = createdAt;
        this.totalAmount = totalAmount;
    }

    public Order(int id, User user, LocalDateTime createdAt, double totalAmount) {
        this.id = id;
        this.user = user;
        this.createdAt = createdAt;
        this.totalAmount = totalAmount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
