package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.dao.ProductDao;
import com.dkt.cgshoppii.model.entity.Product;

import java.util.List;

public class ProductService implements IProductService {
    private ProductDao productDao = new ProductDao();

    @Override
    public List<Product> findAll() {
        return  productDao.findAll();
    }

    @Override
    public List<Product> findByName(String name) {
        return productDao.findByName(name);
    }
//    public List<Product> getAllProducts() {
//        return productDao.findAll();
//    }
//
//    public Product getProductById(int productId) {
//        return productDao.findById(productId);
//    }
//
//    public List<Product> getNewProducts() {
//        return productDao.findNewProducts();
//    }
//
//    public List<Product> getTopSellingProducts() {
//        return productDao.findTopSellingProducts();
//    }
//
//    public boolean addProduct(Product product) {
//        return productDao.save(product);
//    }
//
//    public boolean updateProduct(Product product) {
//        return productDao.update(product);
//    }
//
//    public boolean deleteProduct(int productId) {
//        return productDao.delete(productId);
//    }
}