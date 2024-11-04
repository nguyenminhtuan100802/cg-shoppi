package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.model.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProducts();
    Product getProductById(int productId);
    public List<Product> findAll();

    public List<Product> findByName(String name);

}
