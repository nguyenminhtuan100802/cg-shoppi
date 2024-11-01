package com.dkt.cgshoppii.model.entity;

public class CartItem {
    private int id;
    private double price;
    private int quantity;
    private Cart cart;
    private Product product;

    public CartItem() { }

    public CartItem(double price, int quantity, Cart cart, Product product) {
        this.price = price;
        this.quantity = quantity;
        this.cart = cart;
        this.product = product;
    }

    public CartItem(int id, double price, int quantity, Cart cart, Product product) {
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.cart = cart;
        this.product = product;
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

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}