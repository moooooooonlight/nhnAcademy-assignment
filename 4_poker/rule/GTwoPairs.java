package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class GTwoPairs extends Rule{
 
    public GTwoPairs(){
        this.setRank(7);
        this.setRuleName("twoPairs");
    }

        @Override
    public boolean rule(PokerPlayer p) {
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();

        // 숫자가 같은 카드 2장!
        int rank;
        int result = 0;

        boolean visit[] = new boolean[list.size()];

        for(int i=1;i<list.size();i++){
            rank = list.get(i).getRank();
            
            if(visit[i]==true) continue;

            for(int j=i+1;j<list.size();j++){
                
                if(visit[j]==true) continue;

                if(rank == list.get(j).getRank()){
                    visit[j] = true;
                    visit[i] = true;
                    victory.add(list.get(i));
                    victory.add(list.get(j));
                    result++;
                }
            }
        }
        if(result >= 2){
            p.setVictory(victory);
            return true;
        }else{
            return false;
        }
    }   
}
