package com.dkt.cgshoppii.model.entity;

import java.time.LocalDateTime;
import java.util.List;

public class User {
    private int id;
    private String username;
    private String password;
    private String role;
    private String fullName;
    private String phone;
    private String email;
    private String address;
    private LocalDateTime createdAt;
    private Cart cart; // 1-1 relationship with Cart
    private List<Order> orders;

    public User(){
    }

    public User(String username, String password, String role, String fullName, String phone, String email, String address, LocalDateTime createdAt, Cart cart, List<Order> orders) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.createdAt = createdAt;
        this.cart = cart;
        this.orders = orders;
    }

    public User(int id, String username, String password, String role, String fullName, String phone, String email, String address, LocalDateTime createdAt, Cart cart, List<Order> orders) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.createdAt = createdAt;
        this.cart = cart;
        this.orders = orders;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int id, String username, String password, String role, String fullName, String phone, String email, String address, Object cart, Object orders) {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}