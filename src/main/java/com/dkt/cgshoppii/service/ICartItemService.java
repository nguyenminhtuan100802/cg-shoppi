package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.model.entity.CartItem;

import java.util.List;

public interface ICartItemService {
    List<CartItem> findAllCartItemByCartId(int cartId);
    void addCartItem(int cartId, int productId);
    void deleteCartItemById(int cartItemId);
}
