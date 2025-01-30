package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class AStraightFlush extends Rule{
    

    public AStraightFlush(){
        this.setRank(1);
        this.setRuleName("straightFlush");
    }

    @Override
    public boolean rule(PokerPlayer p) {
        // 일단 무늬가 같은지 확인해야함.
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();

        String pattern = list.get(0).getShape();
        int rank = list.get(0).getRank();
        int cnt = 1;
        for(int i=1;i<list.size();i++){
            if(!pattern.equals(list.get(i).getShape())){
                cnt = 1;
                victory.clear();
                pattern = list.get(i).getShape();
                rank = list.get(i).getRank();
                victory.add(list.get(i)); 
            }else {
                if(rank == list.get(i).getRank()+1){
                    rank = list.get(i).getRank();
                    cnt++;
                    victory.add(list.get(i));
                }else{
                    cnt = 1;
                    victory.clear();
                    pattern = list.get(i).getShape();
                    rank = list.get(i).getRank(); 
                    victory.add(list.get(i));
                }
            }

            if(cnt==5){
                p.setVictory(victory);
                return true;
            }
        }
        return false;
    }
}
