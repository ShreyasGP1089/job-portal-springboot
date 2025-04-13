package com.example.JobApp_2.aop;

import com.example.JobApp_2.model.Job;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.List;

@Aspect
@Component
public class Validation {
    private static final Logger LOGGER= LoggerFactory.getLogger(Validation.class);

    @Around("execution(* com.example.JobApp_2.service.JobService.addjob(..)) && args(job) ")
    public Object monitorTime(ProceedingJoinPoint jp, Job job) throws Throwable {
        if(job.getReqExperience()<0){
            LOGGER.info("Before changing: "+ job.getReqExperience());
            job.setReqExperience(0);
            LOGGER.info("After changing: "+ job.getReqExperience());
        }
        Object obj=jp.proceed(new Object[]{job});
        return obj;
    }

    @Around("execution(* com.example.JobApp_2.service.JobService.search(..)) && args(keyword) ")
    public Object monitorsearch(ProceedingJoinPoint jp, String keyword) throws Throwable {
        if(keyword.length()<2){
           LOGGER.warn("Search keyword too short: '{}'. Minimum 2 characters required.", keyword);
            return List.of();
        }
        Object obj=jp.proceed();
        return obj;
    }
}
