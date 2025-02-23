package com.nhnacademy.quiz02;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Parameter;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

class MultiThreadCounterTest {
    @Test
    void testMultiThreadCounter() throws InterruptedException {
        int maxCount = 1; // 각 스레드가 실행할 반복 횟수
        int threadCount = 100; // 실행할 스레드 개수
        int threadPoolCount = 10;
        MultiThreadCounter counter = new MultiThreadCounter(maxCount);

        ExecutorService executor = Executors.newFixedThreadPool(threadPoolCount);

        for (int i = 0; i < threadCount; i++) {
            executor.submit(counter);
        }

        executor.shutdown();
        executor.awaitTermination(3, TimeUnit.SECONDS);

        assertEquals(threadCount * maxCount, counter.getGlobalCount());
    }

    @Test
    void testNonSynchronizedMultiThreadCount() {
        Class<?> clazz = MultiThreadCounter.class;

        assertDoesNotThrow(() -> {
            for (Method method : clazz.getDeclaredMethods()) {
                assertFalse(Modifier.isSynchronized(method.getModifiers()));
            }
        });
    }
}
