package org.main.thread;

import org.main.channel.HttpJob;
import org.main.channel.RequestChannel;
import org.main.thread.ThreadPool;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class SimpleServer {
    private static int port;
    private static final int DEFAULT_PORT=8080;
    private final RequestChannel requestChannel;

    private final ThreadPool threadPool;

    public SimpleServer(){
        this(DEFAULT_PORT);
    }
    public SimpleServer(int port){
        this.port = port;
        this.requestChannel = new RequestChannel();
        this.threadPool = new ThreadPool(requestChannel);
    }

    public void start(){
        threadPool.start();

        try(ServerSocket serverSocket = new ServerSocket((this.port))){

            while(true){
                Socket client = serverSocket.accept();

                requestChannel.addHttpJob(new HttpJob(client));
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
