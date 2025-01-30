package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class FThreeOfAKind extends Rule{
    
    public FThreeOfAKind(){
        this.setRank(6);
        this.setRuleName("threeOfAKind");
    }


        @Override
    public boolean rule(PokerPlayer p) {
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();
        

        // 숫자가 같은 카드 3장!
        int rank;
        int cnt;

        for(int i=1;i<list.size();i++){
            rank = list.get(i).getRank();
            cnt = 1;
            victory.clear();
            victory.add(list.get(i));

            for(int j=i+1;j<list.size();j++){
                if(rank == list.get(j).getRank()){
                    victory.add(list.get(j));
                    cnt++;
                }
                if(cnt==3){
                    p.setVictory(victory);
                    return true;
                }
            }
        }
        return false;
        
    }
}
