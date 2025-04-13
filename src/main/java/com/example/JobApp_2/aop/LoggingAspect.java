package com.example.JobApp_2.aop;

import org.apache.juli.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

@Component
@Aspect
public class LoggingAspect {

    private static final Logger LOGGER= LoggerFactory.getLogger(LoggingAspect.class);
    //return-type , fullclass-name, method-name, args
//    @Before("execution(* com.example.JobApp_2.service.JobService.*(..)) ")
    @Before("execution(* com.example.JobApp_2.service.JobService.viewalljobs(..)) ")
    public void logMethodCall(JoinPoint jp){
        LOGGER.info("Method called"+ jp.getSignature().getName());
    }

    @After("execution(* com.example.JobApp_2.service.JobService.viewalljobs(..)) ")
    public void logExecution(JoinPoint jp){
        LOGGER.info("Method Executed :"+ jp.getSignature().getName());
    }

    @AfterThrowing("execution(* com.example.JobApp_2.service.JobService.viewalljobs(..)) ")
    public void logError(JoinPoint jp){
        LOGGER.info("Method Executed :"+ jp.getSignature().getName());
    }

    @AfterReturning("execution(* com.example.JobApp_2.service.JobService.viewalljobs(..)) ")
    public void logresult(JoinPoint jp){
        LOGGER.info("Method Executed"+ jp.getSignature().getName());
    }
}
