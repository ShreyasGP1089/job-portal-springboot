package com.example.JobApp_2.repo;
import com.example.JobApp_2.model.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Jobrepo extends JpaRepository<Job,Integer> {


    List<Job> findByPostProfileContainingIgnoreCaseOrPostDescContainingIgnoreCase(String profileKeyword, String descKeyword);


}
