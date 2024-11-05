package com.dkt.cgshoppii.service.impl;

import com.dkt.cgshoppii.dao.ICartItemDAO;
import com.dkt.cgshoppii.dao.impl.CartItemDAO;
import com.dkt.cgshoppii.model.entity.CartItem;
import com.dkt.cgshoppii.service.ICartItemService;

import java.util.List;

public class CartItemService implements ICartItemService {
    ICartItemDAO cartItemDAO = new CartItemDAO();


    @Override
    public List<CartItem> findAllCartItemByCartId(int cartId) {
        return cartItemDAO.findAllCartItemByCartId(cartId);
    }

    @Override
    public void addCartItem(int cartId, int productId) {
        cartItemDAO.addCartItem(cartId, productId);
    }

    @Override
    public void deleteCartItemById(int cartItemId) {
        cartItemDAO.deleteCartItemById(cartItemId);

    }
}
