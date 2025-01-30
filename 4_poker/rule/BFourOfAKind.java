package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class BFourOfAKind extends Rule{

    public BFourOfAKind(){
        this.setRank(2);
        this.setRuleName("fourOfAKind");
    }

     @Override
    public boolean rule(PokerPlayer p) {
        // 숫자가 같은 카드 4장!
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();
        
        int rank;
        int cnt;

        for(int i=1;i<list.size();i++){
            rank = list.get(i).getRank();
            cnt = 1;
            victory.clear();
            victory.add(list.get(i));

            for(int j=i+1;j<list.size();j++){
                if(rank == list.get(j).getRank()){
                    cnt++;
                    victory.add(list.get(j));
                }
                if(cnt==4){
                    p.setVictory(victory);
                    return true;
                }
            }
        }
        return false;
    }   
}