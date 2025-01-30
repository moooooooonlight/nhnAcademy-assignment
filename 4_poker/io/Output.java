package io;

import java.util.Collections;
import java.util.LinkedList;

import rank.Node;

public class Output {

    public void resultPrint(LinkedList<Node> list){
        Collections.sort(list);

        int index=1;
        for(Node n : list){
            System.out.println((index++)+"등: "+n.getRuleName()+" "+n.getPlayer().getName());
        }
    }
}