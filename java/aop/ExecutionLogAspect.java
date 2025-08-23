package com.example.demo.support.logging;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Slf4j
public class ExecutionLogAspect {

    @Around("@annotation(executionLog)")
    public Object logExecution(ProceedingJoinPoint joinPoint, ExecutionLog executionLog) throws Throwable {
        String taskName = executionLog.value();
        log.info("[{}] START ====================", taskName);

        try {
            return joinPoint.proceed();
        } catch (Throwable t) {
            log.error("[{}] EXCEPTION ==================== {}", taskName, t.getMessage(), t);
            t.printStackTrace();
            throw t; // propagate the exception
        } finally {
            log.info("[{}] FINISH  ====================", taskName);
        }
    }
}
