package com.example.JobApp_2.service;

import com.example.JobApp_2.model.Job;
import com.example.JobApp_2.repo.Jobrepo;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {
    @Autowired
    Jobrepo repo;

    public void addjob(Job job){
        repo.save(job);
    }

    public List<Job> viewalljobs(){
       return repo.findAll();
    }

    public void delete(int id) {
        repo.deleteById(id);
    }

    public List<Job> search(String keyword) {
        return repo.findByPostProfileContainingIgnoreCaseOrPostDescContainingIgnoreCase(keyword,keyword);
    }
}
