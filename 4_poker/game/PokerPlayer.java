package game;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

public class PokerPlayer{
    String name;
    ArrayList<PokerCard> cards;
    LinkedList<PokerCard> victory;

    public PokerPlayer(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }

    public void setCards(ArrayList<PokerCard> cards){
        this.cards = cards;
    }

    public ArrayList<PokerCard> getCards(){
        return this.cards;
    }

    public void setVictory(LinkedList<PokerCard> victory){
        this.victory = victory;
    }

    public LinkedList<PokerCard> getVictory(){
        return this.victory;
    }
    
    public void cardSort(){
        Collections.sort(this.cards);
    }
}
