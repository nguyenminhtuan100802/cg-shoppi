package com.dkt.cgshoppii.model.entity;

import java.time.LocalDateTime;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private int inventoryQuantity;
    private String status;
    private LocalDateTime createdAt;

    public Product () {}

    public Product(String name, String description, double price, int inventoryQuantity, String status, LocalDateTime createdAt) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.inventoryQuantity = inventoryQuantity;
        this.status = status;
        this.createdAt = createdAt;
    }

    public Product(int id, String name, String description, double price, int inventoryQuantity, String status, LocalDateTime createdAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.inventoryQuantity = inventoryQuantity;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getInventoryQuantity() {
        return inventoryQuantity;
    }

    public void setInventoryQuantity(int inventoryQuantity) {
        this.inventoryQuantity = inventoryQuantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}