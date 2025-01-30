import io.InputT;
import io.Output;
import rank.Node;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerDealer;
import game.PokerPlayer;

public class JDBJ09_001_Poker{
    public static void main(String[] args) throws NumberFormatException, IOException{
        InputT inputT = new InputT();
        ArrayList<PokerPlayer> players = inputT.makingPlayer(); // 플레이어 만들기.
        PokerDealer dealer = new PokerDealer(players); 
        dealer.suffle(inputT.getplayerNo()); // 플레이어 카드 나눠주기.

        for(PokerPlayer p : players){
            p.cardSort(); // 각 player별로 카드 정렬해주어야함.
        }

        // 카드 순위 체크하기
        LinkedList<Node> rank = dealer.ranking();

        Output output = new Output();
        output.resultPrint(rank);// 결과 출력하기
    }
}