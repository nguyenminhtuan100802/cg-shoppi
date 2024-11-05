package com.dkt.cgshoppii.service.impl;

import com.dkt.cgshoppii.dao.ICartDAO;
import com.dkt.cgshoppii.dao.impl.CartDAO;
import com.dkt.cgshoppii.service.ICartService;

public class CartService implements ICartService {
    ICartDAO cartDAO = new CartDAO();
    @Override
    public int findCartIdByUsername(String username) {
        return cartDAO.findCartIdByUsername(username);
    }
}
