package com.nhnacademy.quiz01;

import org.junit.jupiter.api.Test;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import static org.junit.jupiter.api.Assertions.*;

public class MultiThreadCounterTest {

    @Test
    void testSingleThreadExecution() {
        MultiThreadCounter counter = new MultiThreadCounter(10);
        Thread thread = new Thread(counter);
        thread.start();

        try {
            thread.join();
        } catch (InterruptedException e) {
            fail("Thread interrupted");
        }

        assertEquals(10, counter.getGlobalCount());
    }

    @Test
    void testMultiThreadExecution() throws InterruptedException {
        int maxCount = 1000;
        int threadCount = 4;
        MultiThreadCounter counter = new MultiThreadCounter(maxCount);

        ExecutorService executor = Executors.newFixedThreadPool(threadCount);

        for (int i = 0; i < threadCount; i++) {
            executor.submit(counter);
        }

        executor.shutdown();
        executor.awaitTermination(3, TimeUnit.SECONDS);

        assertEquals(threadCount * maxCount, counter.getGlobalCount());
    }

    @Test
    void testNegativeMaxCount() {
        assertThrows(IllegalArgumentException.class, () -> new MultiThreadCounter(-1));
    }
}
