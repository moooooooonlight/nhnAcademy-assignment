package com.nhnacademy.quiz02;

import java.util.concurrent.atomic.AtomicInteger;

public class MultiThreadCounter implements Runnable {
    // TODO: 필드를 선언하세요.
    ThreadLocal<Integer>  localCount;
    private int globalCount;
    private final int maxCount;
    AtomicInteger atomicInteger;
    public MultiThreadCounter(int maxCount) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        localCount = ThreadLocal.withInitial(() -> 0);
        globalCount = 0;
        atomicInteger = new AtomicInteger(0);
        this.maxCount = maxCount;
    }

    public int getGlobalCount() {
        // TODO: 요구 기능을 구현하세요.
        globalCount = atomicInteger.get();
        return globalCount;
    }

    @Override
    public void run() {
        // TODO: 요구 기능을 구현하세요.
        for(int i=0;i<maxCount;i++){
            localCount.set(localCount.get().intValue()+1);
            globalCount = atomicInteger.incrementAndGet();
        }
        localCount.remove();
    }
}
