package com.example.JobApp_2.service;

import com.example.JobApp_2.model.users;
import com.example.JobApp_2.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepo repo;
    private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder(12);

    public users addUser(users user) {
        user.setPassword(encoder.encode(user.getPassword()));
        return repo.save(user);
    }
}