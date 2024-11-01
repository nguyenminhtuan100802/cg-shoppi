package com.dkt.cgshoppii.model.entity;

public class OrderItem {
    private int id;
    private double price;
    private int quantity;
    private Product product;
    private Order order;

    public OrderItem() {}

    public OrderItem(double price, int quantity, Product product, Order order) {
        this.price = price;
        this.quantity = quantity;
        this.product = product;
        this.order = order;
    }

    public OrderItem(int id, double price, int quantity, Product product, Order order) {
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.product = product;
        this.order = order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}