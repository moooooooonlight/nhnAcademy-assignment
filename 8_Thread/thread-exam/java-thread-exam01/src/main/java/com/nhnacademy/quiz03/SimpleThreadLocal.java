package com.nhnacademy.quiz03;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Supplier;

public class SimpleThreadLocal<T> {
    // TODO: 필드를 선언하세요.
    Supplier<T> supplier;
    Map<Thread, Supplier> map;

    public SimpleThreadLocal(Supplier<T> supplier) {
        // TODO: 인수 검증과 필드 초기화를 하세요.
        if(Objects.isNull(supplier)){
            throw new IllegalArgumentException();
        }
        this.supplier = supplier;
        this.map = new ConcurrentHashMap<>();
        map.put(Thread.currentThread(),supplier);
    }

    public T get() {
        // TODO: 요구 기능을 구현하세요.
        return (T) map.get(Thread.currentThread());
    }

    public T get(Thread thread) {
        // TODO: 요구 기능을 구현하세요.
        return (T) map.getOrDefault((Object) thread,supplier.get());
    }

    public void set(T value) {
        // TODO: 요구 기능을 구현하세요.
        map.put(Thread.currentThread(), ()->value);
    }

    public void remove() {
        // TODO: 요구 기능을 구현하세요.
        map.remove(Thread.currentThread());
    }

    public void remove(Thread thread) {
        // TODO: 요구 기능을 구현하세요.
        map.remove(thread);
    }
}
