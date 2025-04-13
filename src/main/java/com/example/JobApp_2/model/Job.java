package com.example.JobApp_2.model;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@Entity
public class Job {
    @Id
    private int postId;
    private String postDesc;
    private String postProfile;
    private int reqExperience;

    private List<String> postTechStack;

}
