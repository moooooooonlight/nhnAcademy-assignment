package com.nhnacademy.quiz05;

import java.util.Random;

public class Producer implements Runnable {
    // TODO: 필드를 선언하세요.
    private Market market;
    private long maxWaitTime;

    public Producer(Market market, long maxWaitTime) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        this.market = market;
        this.maxWaitTime = maxWaitTime;
    }


    /**
     * 랜덤 품목을 생산하여 마트에 추가함.
     * 소비자가 특정 품목의 일정 수량을 구매.
     */
    @Override
    public void run() {
        // TODO: 요구 기능을 구현하세요.
    }

}