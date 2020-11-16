package com.zdz.service;

import com.zdz.domain.User;

import java.util.List;

public interface UserService {

    public boolean register(User user);

    public User login(User user);

    public List<User> checkExists(String username);

}
