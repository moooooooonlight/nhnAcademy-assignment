package com.nhnacademy.quiz05;

import java.beans.Customizer;
import java.util.*;

public class Market {
    // TODO: 필드를 선언하세요.
    public int maxCapacity;
    private Set<String> products;

    private Queue<Consumer> enteringQueue;
    private Queue<Consumer> enteredQueue;
    ThreadLocal<Map<String, Integer>> buyMap;
    Map<String, Integer> storeMap;
    private final int LIMIT = 5;
    public Market(Set<String> products, int maxCapacity) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        if(Objects.isNull(products) || maxCapacity < 0) {
            throw new IllegalArgumentException();
        }

        this.products = products;
        this.maxCapacity = maxCapacity;
        enteringQueue = new LinkedList<>();
        enteredQueue = new LinkedList<>();
        buyMap = new ThreadLocal<>();
        storeMap = new HashMap<>();
    }

    public synchronized void storeProduct(String product, int quantity, long waitTime) throws InterruptedException {
        // TODO: 요구 기능을 구현하세요.
        if(Objects.isNull(product) || quantity<0 || waitTime<0){
            throw new IllegalArgumentException();
        }

        Producer storeProducer = new Producer(this, waitTime);
        storeMap.put(product,quantity);
        Thread producerThread = new Thread(storeProducer);
        producerThread.start();

        Thread.sleep(waitTime);
    }

    public synchronized boolean buyProduct(String product, int quantity) {
        // TODO: 요구 기능을 구현하세요.
        Consumer buyConsumer = new Consumer(this);
        buyMap.get().put(product,quantity);
        Thread customerThread = new Thread(buyConsumer);

        customerThread.start();

        try {
            customerThread.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public void enterMarket() throws InterruptedException {
        // TODO: 요구 기능을 구현하세요.
        if(enteringQueue.size()>=LIMIT){
            wait();
        }

        enteredQueue.add(enteredQueue.poll());
    }

    public void leaveMarket() {
        // TODO: 요구 기능을 구현하세요.
        if(!enteredQueue.isEmpty()){
            enteredQueue.remove();
            notifyAll();
        }
    }

    public synchronized int getStock(String product) { // 제고 확인.
        if(Objects.isNull(product)){
            throw new IllegalArgumentException();
        }
        // TODO: 요구 기능을 구현하세요.
        return storeMap.get(product);
    }
}
