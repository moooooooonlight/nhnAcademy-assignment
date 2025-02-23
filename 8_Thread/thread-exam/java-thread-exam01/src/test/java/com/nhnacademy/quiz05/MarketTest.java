package com.nhnacademy.quiz05;

import org.junit.jupiter.api.Test;

import com.nhnacademy.quiz05.Market;

import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import static org.junit.jupiter.api.Assertions.*;

public class MarketTest {

    @Test
    void testInvalidMarketInitialization() {
        assertThrows(IllegalArgumentException.class, () -> new Market(null, 5));
        assertThrows(IllegalArgumentException.class, () -> new Market(Set.of(), 5));
        assertThrows(IllegalArgumentException.class, () -> new Market(Set.of("사과"), 0));
    }

    @Test
    void testMultiThreadedMarket() throws InterruptedException {
        Market market = new Market(Set.of("사과", "배", "감자", "양파"), 10);
        ExecutorService executor = Executors.newFixedThreadPool(25); // 20명의 손님 + 생산자

        // 생산자 2명 실행 (대기 시간 3초 설정)
        for (int i = 0; i < 2; i++) {
            executor.submit(() -> {
                try {
                    market.storeProduct("사과", 2, 3000);
                } catch (InterruptedException ignored) {
                }
            });
        }

        // 20명의 손님이 순차적으로 방문
        for (int i = 0; i < 20; i++) {
            executor.submit(() -> {
                try {
                    market.enterMarket();
                    market.buyProduct("사과", 1);
                    market.leaveMarket();
                } catch (InterruptedException ignored) {
                }
            });
        }

        // 5초 동안 실행 후 종료
        Thread.sleep(5000);
        executor.shutdown();
        executor.awaitTermination(3, TimeUnit.SECONDS);

        // 마트 재고가 0~10개 사이여야 함 (최대 10개 저장 가능)
        assertTrue(market.getStock("사과") >= 0 && market.getStock("사과") <= 10);
    }
}
