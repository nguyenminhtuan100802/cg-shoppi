package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.model.entity.Product;

public interface IProductDAO {
    Product getProductById(int productId);
}
