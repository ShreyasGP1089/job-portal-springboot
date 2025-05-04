package com.example.JobApp_2.repo;

import com.example.JobApp_2.model.users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<users, String> {
    users findByUsername(String username);
}
