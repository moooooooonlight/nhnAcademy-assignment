package game;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Random;

import rank.Node;
import rank.Ranking;

public class PokerDealer{
    String[] cardPattern = {"Clover","Heart","Diamond","Spade"};
    String[] cardNumber = {"2","3","4","5","6","7","8","9","10","J","Q","K","A"};
    ArrayList<PokerPlayer> players;

    public PokerDealer(ArrayList<PokerPlayer> players){
        this.players = players;
    }


    // 플레이어 카드 섞기.
    public void suffle(int playerNo){
        for(int i=0;i<playerNo;i++){
            Random random = new Random();
            ArrayList<PokerCard> array = new ArrayList<>();
            boolean[] cardUsed = new boolean[53];
            
            int index = 0;
            while(index<5){
                int temp = random.nextInt(52);
                if(!cardUsed[temp]){
                    int patternIxd = temp/13;
                    int numberIxd = temp%13;
                    array.add(new PokerCard(temp,cardNumber[numberIxd], numberIxd,cardPattern[patternIxd]));
                    cardUsed[temp] = true;
                    index++;
                }
            }
            this.players.get(i).setCards(array);
        }
    }



    // 플레이어 별로 rule을 하나씩 적용시키기.
    public LinkedList<Node> ranking(){
        Ranking ranking = new Ranking();
        LinkedList<Node> result = ranking.ranking(this.players);
        return result;
    }
}