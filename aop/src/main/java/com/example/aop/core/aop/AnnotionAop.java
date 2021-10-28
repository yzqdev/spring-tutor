package com.example.aop.core.aop;

import com.example.aop.annotation.AuthMethod;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * @author yanni
 */
@Slf4j
@Aspect
@Component
public class AnnotionAop {

    @Pointcut("@annotation(com.example.aop.annotation.AuthMethod)")
    public void test() {

    }

    @Before("test()")
    public void beforeAdvice() {
        System.out.println("beforeAdvice...");
    }

    @After("test()")
    public void afterAdvice() {
        System.out.println("afterAdvice...");
    }

    @Around("test()")
    public Object aroundAdvice(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("before");
        //下面需要注解
        MethodSignature methodSignature = (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = methodSignature.getMethod();
        AuthMethod authMethod = method.getAnnotation(AuthMethod.class);
       if (authMethod.value()) {
            Object obj = proceedingJoinPoint.proceed();
            log.info("由于有authmethod注解");
            log.info(">>>认证成功");
            return obj;
        }else {
           log.info("由于authmethod值为false");
           log.info("认证失败");
       }
        System.out.println("after");
        return proceedingJoinPoint.proceed();
    }

}