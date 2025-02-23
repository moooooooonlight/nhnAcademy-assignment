package com.nhnacademy.quiz04;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeoutException;

public class SharedQueue {
    // TODO: 필드를 선언하세요.
    List<Integer> queue;
    private final int maxSize;
    private long startTime;

    public SharedQueue(int maxSize) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        this.maxSize = maxSize;
        queue = Collections.synchronizedList(new LinkedList<>());
        this.startTime = System.currentTimeMillis();
    }

    public void enqueue(int value) {
        // TODO: 요구 기능을 구현하세요.
        if(value < 0) {
            throw new IllegalArgumentException();
        }

        synchronized (queue){
            while(queue.size() >= maxSize) {
                try {
                    // 오브젝트에 rock을 걸기 위해 wait()이 아닌 queue.wait()을 사용.
                    queue.wait();
                } catch (InterruptedException e) {
                    throw new RuntimeException();
                }
            }
            queue.add(value);
            queue.notifyAll();
        }
    }

    public synchronized void enqueue(int value, long timeout) throws TimeoutException {
        // TODO: 요구 기능을 구현하세요.
        if(value < 0 || timeout < 0) {
            throw new IllegalArgumentException();
        }
        synchronized (queue){
            while(queue.size() >= maxSize) {
                try {
                    queue.wait(timeout);
                    timeout -= (System.currentTimeMillis() - startTime);
                    if(timeout<0){
                        throw new TimeoutException();
                    }

                    queue.wait(timeout);
                } catch (Exception e) {
                    throw new TimeoutException();
                }
            }

            queue.add(value);
            queue.notifyAll();
        }
    }

    public synchronized int dequeue() {
        // TODO: 요구 기능을 구현하세요.
        synchronized (queue) {
            while(queue.isEmpty()) {
                try {
                    queue.wait();
                } catch (InterruptedException e) {
                    throw new RuntimeException();
                }
            }

            queue.notifyAll();
            return queue.removeFirst();
        }
    }

    public synchronized int dequeue(long timeout) throws TimeoutException {
        // TODO: 요구 기능을 구현하세요.
        synchronized (queue){
            while(queue.isEmpty()) {
                try {
                    queue.wait(timeout);
                } catch (Exception e) {
                    throw new TimeoutException();
                    //Thread.currentThread().interrupt();
                }
            }

            int first = queue.getFirst();
            queue.removeFirst();
            queue.notifyAll();
            return first;
        }
    }

    public synchronized int size() {
        // TODO: 요구 기능을 구현하세요.
        return queue.size();
    }
}
