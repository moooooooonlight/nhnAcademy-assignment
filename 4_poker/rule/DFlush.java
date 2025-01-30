package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class DFlush extends Rule{

    public DFlush(){
        this.setRank(4);
        this.setRuleName("flush");
    }

        @Override
    public boolean rule(PokerPlayer p) {
        // 무늬가 같은 카드 5장!
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();
        String pattern;
        int cnt;

        for(int i=1;i<list.size();i++){
            pattern = list.get(i).getShape();
            cnt = 1;
            victory.clear();
            victory.add(list.get(i));
            for(int j=i+1;j<list.size();j++){
                if(pattern.equals(list.get(i).getShape())){
                    victory.add(list.get(j));
                    cnt++;
                }
                if(cnt==5){
                    p.setVictory(victory);;
                    return true;
                }
            }
        }
        return false;
        
    }
}
