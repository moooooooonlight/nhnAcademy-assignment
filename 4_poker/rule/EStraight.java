package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class EStraight extends Rule{

    public EStraight(){
        this.setRank(5);
        this.setRuleName("straight");
    }

    
        @Override
    public boolean rule(PokerPlayer p) {

        // 숫자가 이어지는 카드 5장.
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();
        
        int rank = list.get(0).getRank();
        int cnt = 1;

        for(int i=1;i<list.size();i++){
            if(rank == list.get(i).getRank()+1){
                rank = list.get(i).getRank();
                victory.add(list.get(i));
                cnt++;
            }else{
                cnt = 1;
                rank = list.get(i).getRank();
                victory.clear();
                victory.add(list.get(i));
            }

            if(cnt==5){
                p.setVictory(victory);
                return true;
            }
        }
        return false;        
    }
}
