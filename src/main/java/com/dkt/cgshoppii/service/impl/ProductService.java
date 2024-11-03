package com.dkt.cgshoppii.service.impl;

import com.dkt.cgshoppii.dao.IProductDAO;
import com.dkt.cgshoppii.dao.impl.ProductDAO;
import com.dkt.cgshoppii.model.entity.Product;
import com.dkt.cgshoppii.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductDAO productDAO = new ProductDAO();

    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    @Override
    public Product getProductById(int productId) {
        return productDAO.getProductById(productId);
    }
}
