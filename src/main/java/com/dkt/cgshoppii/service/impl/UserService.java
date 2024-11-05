package com.dkt.cgshoppii.service.impl;

import com.dkt.cgshoppii.dao.IUserDAO;
import com.dkt.cgshoppii.dao.impl.UserDAO;
import com.dkt.cgshoppii.model.entity.User;
import com.dkt.cgshoppii.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private final IUserDAO userDAO = new UserDAO(); // Use final for better readability
    @Override
    public List<User> findAllUsers() {
        return userDAO.findAllUsers();
    }
}
