package com.example.JobApp_2.Controller;

import com.example.JobApp_2.model.users;
import com.example.JobApp_2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("Users")
    public users addUser(@RequestBody users user){
        return userService.addUser(user);
    }
}

