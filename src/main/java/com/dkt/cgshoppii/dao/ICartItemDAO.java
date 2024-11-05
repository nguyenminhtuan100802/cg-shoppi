package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.model.entity.Cart;
import com.dkt.cgshoppii.model.entity.CartItem;
import com.dkt.cgshoppii.model.entity.Product;

import java.util.List;

public interface ICartItemDAO {
    List<CartItem> findAllCartItemByCartId(int cartId);
    void addCartItem(int cartId, int productId);
    void deleteCartItemById(int cartItemId);
}
