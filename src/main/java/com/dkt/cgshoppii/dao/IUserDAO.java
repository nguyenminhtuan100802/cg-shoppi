package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.model.entity.User;

import java.util.List;


public interface IUserDAO {
    List<User> findAllUsers();
}
