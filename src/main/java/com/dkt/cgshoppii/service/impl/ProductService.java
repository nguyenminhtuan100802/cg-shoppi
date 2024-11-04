package com.dkt.cgshoppii.service.impl;

import com.dkt.cgshoppii.dao.IProductDAO;
import com.dkt.cgshoppii.dao.impl.ProductDAO;
import com.dkt.cgshoppii.model.entity.Product;
import com.dkt.cgshoppii.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductDAO productDAO = new ProductDAO();


    @Override
    public List<Product> findAllProducts() {
        return productDAO.findAllProducts();
    }

    @Override
    public Product findProductById(int productId) {
        return productDAO.findProductById(productId);
    }

    @Override
    public List<Product> findProductByName(String name) {
        return productDAO.findProductByName(name);
    }

}