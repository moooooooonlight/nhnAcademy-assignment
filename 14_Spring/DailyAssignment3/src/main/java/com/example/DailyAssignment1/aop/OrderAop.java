package com.example.DailyAssignment1.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Slf4j
@Component
public class OrderAop {
    @Pointcut("execution(* com.example.DailyAssignment1.bean..*(..)))")
    public void orderCut(){}


    @Around("orderCut()")
    public Object logging(ProceedingJoinPoint joinPoint) throws Throwable {

        log.info("--> {}", joinPoint.getStaticPart().getSignature());

        Object object = joinPoint.proceed();

        log.info("<-- {}", joinPoint.getStaticPart().getSignature());
        return object;
    }
}
