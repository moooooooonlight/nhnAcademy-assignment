/*
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * + Copyright 2024. NHN Academy Corp. All rights reserved.
 * + * While every precaution has been taken in the preparation of this resource,  assumes no
 * + responsibility for errors or omissions, or for damages resulting from the use of the information
 * + contained herein
 * + No part of this resource may be reproduced, stored in a retrieval system, or transmitted, in any
 * + form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without the
 * + prior written permission.
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 */

package com.nhnacademy.server.thread.channel;

import java.util.LinkedList;
import java.util.Queue;

public class RequestChannel {
    private final Queue<Executable> requestQueue;
    private long QUEUE_MAX_SIZE = 10;

    public RequestChannel() {
        this.requestQueue = new LinkedList<>();
    }

    public synchronized void addJob(Executable executable){
        while(requestQueue.size() >= QUEUE_MAX_SIZE){
            try {
                wait();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        requestQueue.add(executable);
        notify();
    }

    public synchronized Executable getJob(){
        while(requestQueue.isEmpty()){
            try {
                wait();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
        notify();
        return requestQueue.poll();
    }

}
