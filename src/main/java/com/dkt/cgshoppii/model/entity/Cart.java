package com.dkt.cgshoppii.model.entity;

import java.time.LocalDateTime;
import java.util.List;

public class Cart {
    private int id;
    private LocalDateTime createdAt;
    private User user;
    private List<CartItem> cartItems;

   public Cart () {}

    public Cart(LocalDateTime createdAt, User user) {
        this.createdAt = createdAt;
        this.user = user;
    }

    public Cart(int id, LocalDateTime createdAt, User user) {
        this.id = id;
        this.createdAt = createdAt;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}