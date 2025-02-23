package com.nhnacademy.quiz01;

public class MultiThreadCounter implements Runnable {
    // TODO: 필드를 선언하세요.

    private int localCount;
    private static int globalCount = 0;
    private final int maxCount;

    public MultiThreadCounter(int maxCount) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        if(maxCount<0){
            throw new IllegalArgumentException();
        }

        this.localCount = 0;
        this.maxCount = maxCount;
    }

    public int getGlobalCount() {
        // TODO: 요구 기능을 구현하세요.
        synchronized (this){
            return globalCount;
        }
    }

    @Override
    public void run() {
        // TODO: 요구 기능을 구현하세요.
        for(int i=0;i<maxCount;i++){
            localCount++;

            synchronized (this){
                globalCount++;
            }
        }
    }
}
