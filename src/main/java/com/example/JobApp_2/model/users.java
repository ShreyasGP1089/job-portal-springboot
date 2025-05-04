package com.example.JobApp_2.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Entity
@Component
public class users {
    @Id
    private String username;
    @Setter
    private String password;


    public String getUsername() {
        return username;
    }

    public void setPassword(String password){
        this.password=password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
}
