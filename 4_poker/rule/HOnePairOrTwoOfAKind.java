package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class HOnePairOrTwoOfAKind extends Rule{
 
 
    public HOnePairOrTwoOfAKind(){
        this.setRank(8);
        this.setRuleName("onePairOrTwoOfAKind");
    }

        @Override
    public boolean rule(PokerPlayer p) {
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();

        // 숫자가 같은 카드 2장!
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
                if(cnt==2){
                    p.setVictory(victory);
                    return true;
                }
            }
        }
        return false;
    }
}
