package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.model.entity.Product;

import java.util.List;

public interface IProductDAO {
    List<Product> getAllProducts();
    Product getProductById(int productId);
}
