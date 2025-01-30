package rule;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;

public class IHighCard extends Rule{
 
    public IHighCard(){
        this.setRank(9);
        this.setRuleName("highCard");
    }

    
    @Override
    public boolean rule(PokerPlayer p) {
        ArrayList<PokerCard> list = p.getCards();
        LinkedList<PokerCard> victory = new LinkedList<>();

        victory.add(list.get(0));
        p.setVictory(victory);
        return true;
    }
}
