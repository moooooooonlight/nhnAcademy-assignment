package com.nhnacademy.quiz05;

import java.util.Objects;

public class Consumer implements Runnable {
    // TODO: 필드를 선언하세요.
    private Market market;

    public Consumer(Market market) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        if(Objects.isNull(market)) {
            throw new IllegalArgumentException();
        }

        this.market = market;
    }

    /**
     * 랜덤 품목을 구매하려고 시도.
     * 해당 품목이 없으면 구매하지 않고 지나감.
     * 최대 5명만 입장 가능.
     */
    @Override
    public void run() {
        // TODO: 요구 기능을 구현하세요.

    }
}