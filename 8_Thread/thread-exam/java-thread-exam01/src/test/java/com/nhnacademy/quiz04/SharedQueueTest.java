package com.nhnacademy.quiz04;

import org.awaitility.Awaitility;
import org.junit.jupiter.api.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import static org.junit.jupiter.api.Assertions.*;

public class SharedQueueTest {

    @Test
    void testEnqueueAndDequeue() throws InterruptedException {
        SharedQueue queue = new SharedQueue(2);

        queue.enqueue(10);
        queue.enqueue(20);
        assertEquals(10, queue.dequeue());
        assertEquals(20, queue.dequeue());
    }

    @Test
    void testEnqueueBlocking() throws InterruptedException {
        SharedQueue queue = new SharedQueue(1);

        ExecutorService executor = Executors.newSingleThreadExecutor();

        executor.submit(() -> {
            try {
                Thread.sleep(10);
                queue.enqueue(100);
                queue.enqueue(200); // 블로킹됨 (큐가 꽉 참)
            } catch (InterruptedException ignored) {
            }
        });

        Thread.sleep(500);
        assertEquals(100, queue.dequeue()); // 하나 dequeue 하면 enqueue(200) 실행 가능
        executor.shutdown();
    }

    @Test
    void testDequeueBlocking() throws InterruptedException {
        SharedQueue queue = new SharedQueue(2);

        ExecutorService executor = Executors.newSingleThreadExecutor();

        executor.submit(() -> {
            try {
                Thread.sleep(1000);
                queue.enqueue(50);
            } catch (InterruptedException ignored) {
            }
        });

        Awaitility.await().between(500, TimeUnit.MILLISECONDS, 2000, TimeUnit.MILLISECONDS)
                .until(() -> queue.dequeue() == 50);
        executor.shutdown();
    }

    @Test
    void testEnqueueWithTimeout() {
        SharedQueue queue = new SharedQueue(1);
        assertThrows(TimeoutException.class, () -> {
            queue.enqueue(100);
            queue.enqueue(200, 1000); // 1초 내에 공간이 안 나면 TimeoutException 발생
        });
    }

    @Test
    void testDequeueWithTimeout() {
        SharedQueue queue = new SharedQueue(2);
        assertThrows(TimeoutException.class, () -> queue.dequeue(1000)); // 1초 내에 데이터가 안 들어오면 TimeoutException 발생
    }

    @Test
    void testMultiThreadedQueue() throws InterruptedException {
        SharedQueue queue = new SharedQueue(3);
        ExecutorService executor = Executors.newFixedThreadPool(5);

        executor.submit(() -> {
            try {
                Thread.sleep(10);
                queue.enqueue(1);
                queue.enqueue(2);
                queue.enqueue(3);
            } catch (InterruptedException ignored) {
            }
        });

        executor.submit(() -> {
            try {
                Thread.sleep(500);
                assertEquals(1, queue.dequeue());
                assertEquals(2, queue.dequeue());
                assertEquals(3, queue.dequeue());
            } catch (InterruptedException ignored) {
            }
        });

        executor.shutdown();
        executor.awaitTermination(3, TimeUnit.SECONDS);
    }
}
