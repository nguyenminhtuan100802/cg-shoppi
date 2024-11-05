package com.dkt.cgshoppii.model.entity;

import java.time.LocalDateTime;
import java.util.List;

public class Cart {
    private int id;
    private LocalDateTime createdAt;
    private int userId;
    private List<CartItem> cartItems;

   public Cart () {}

    public Cart(LocalDateTime createdAt, int userId) {
        this.createdAt = createdAt;
        this.userId = userId;
    }

    public Cart(int id, LocalDateTime createdAt, int userId) {
        this.id = id;
        this.createdAt = createdAt;
        this.userId = userId;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
}