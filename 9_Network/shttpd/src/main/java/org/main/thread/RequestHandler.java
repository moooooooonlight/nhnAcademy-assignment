package org.main.thread;

import org.main.channel.Executable;
import org.main.channel.RequestChannel;

import java.io.IOException;


public class RequestHandler implements Runnable{

    private final RequestChannel requestChannel;

    public RequestHandler(RequestChannel requestChannel){
        this.requestChannel = requestChannel;
    }

    @Override
    public void run() {

        while(!Thread.currentThread().isInterrupted()){
            try{
                Executable httpJob = requestChannel.getHttpJob();
                httpJob.execute();

            }catch (IOException e){
                System.out.println("error!!!");
            }
        }
    }
}
