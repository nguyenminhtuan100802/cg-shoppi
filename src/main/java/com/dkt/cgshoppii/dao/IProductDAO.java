package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.model.entity.Product;

import java.util.List;

public interface IProductDAO {
    List<Product> findAllProducts();
    Product findProductById(int productId);
    List<Product> findProductByName(String name);
}
