package org.main;


import org.main.thread.SimpleServer;

public class Main {
    public static void main(String[] args) {
        SimpleServer server;
        if(args.length >= 1) {
            server = new SimpleServer(Integer.parseInt(args[0]));
        }else{
            server = new SimpleServer();
        }
        server.start();
    }
}