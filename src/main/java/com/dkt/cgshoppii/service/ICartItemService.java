package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.model.entity.CartItem;

import java.util.List;

public interface ICartItemService {
    List<CartItem> getAllCartItemByCartId(int cartId);
    void deleteCartItemById(int cartItemId);

}
