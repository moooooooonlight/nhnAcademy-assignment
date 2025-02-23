package com.nhnacademy.quiz03;

import org.junit.jupiter.api.Test;

import com.nhnacademy.quiz03.SimpleThreadLocal;

import static org.junit.jupiter.api.Assertions.*;

public class SimpleThreadLocalTest {

    @Test
    void testThreadLocalIndependentValues() throws InterruptedException {
        SimpleThreadLocal<Integer> threadLocal = new SimpleThreadLocal<>(() -> 0);

        Thread thread1 = new Thread(() -> {
            assertEquals(0, threadLocal.get()); // 초기값 확인
            threadLocal.set(100);
            assertEquals(100, threadLocal.get()); // 설정 후 확인
        });

        Thread thread2 = new Thread(() -> {
            assertEquals(0, threadLocal.get()); // 초기값 확인
            threadLocal.set(200);
            assertEquals(200, threadLocal.get()); // 설정 후 확인
        });

        thread1.start();
        thread2.start();
        thread1.join();
        thread2.join();

        // 메인 스레드에서도 독립적으로 동작해야 함
        assertEquals(0, threadLocal.get());
        threadLocal.set(300);
        assertEquals(300, threadLocal.get());
    }

    @Test
    void testRemoveFunctionality() throws InterruptedException {
        SimpleThreadLocal<Integer> threadLocal = new SimpleThreadLocal<>(() -> -1);

        Thread thread = new Thread(() -> {
            threadLocal.set(42);
            assertEquals(42, threadLocal.get());
            threadLocal.remove();
            assertEquals(-1, threadLocal.get()); // remove() 후 초기값 반환
        });

        thread.start();
        thread.join();
    }
}
