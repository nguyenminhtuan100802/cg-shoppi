package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.model.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAllProducts();
    Product findProductById(int productId);
    List<Product> findProductByName(String name);

}
