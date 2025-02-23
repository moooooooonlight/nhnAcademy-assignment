package org.main.thread;

import org.junit.runner.Request;
import org.main.channel.RequestChannel;

import java.util.Objects;

public class ThreadPool {
    private final static int DEFAULT_POOL_SIZE=5;

    private final int poolSize;
    private final Thread[] threads;

    private final RequestChannel requestChannel;
    public ThreadPool(RequestChannel requestChannel){
        this(DEFAULT_POOL_SIZE, requestChannel);
    }

    public ThreadPool(int poolSize,RequestChannel requestChannel){
        if(poolSize <1){
            throw new IllegalArgumentException("poolSize: > 0");
        }
        if(Objects.isNull(requestChannel)){
            throw new IllegalArgumentException("requestChannel is null");
        }


        this.poolSize =  poolSize;
        this.requestChannel = requestChannel;
        this.threads = new Thread[this.poolSize];

        RequestHandler requestHandler = new RequestHandler(requestChannel);

        for(int i=0;i<this.poolSize;i++){
            threads[i] = new Thread(requestHandler);
            threads[i].setName("thread-"+i+1);
        }
    }

    public synchronized void start(){
        for(int i=0;i<this.poolSize;i++){
            threads[i].start();
        }
    }

    public synchronized void stop(){
        for(int i=0;i<this.poolSize;i++){
            threads[i].interrupt();
        }

        for(int i=0;i<this.poolSize;i++){
            try {
                threads[i].join();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }

    }

}
