package io;

import game.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class InputT {
    
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    int playerNo;

    public void setPlayerNo(int playerNo){
        this.playerNo = playerNo;
    }

    public int getplayerNo(){
        return this.playerNo;
    }


    public ArrayList<PokerPlayer> makingPlayer() throws IOException{
        System.out.print("Enter player number: ");
        this.playerNo = Integer.parseInt(br.readLine());
        

        // 플레이어 객체 생성 및 이름 지정.
        ArrayList<PokerPlayer> players = new ArrayList<>();
        for(int i=0;i<playerNo;i++){
            System.out.print("Enter player name: ");
            String playerName = br.readLine(); 
            PokerPlayer player = new PokerPlayer(playerName);
            players.add(player);
        }
        return players;
    }    
}
