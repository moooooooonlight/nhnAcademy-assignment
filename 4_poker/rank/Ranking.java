package rank;

import java.util.ArrayList;
import java.util.LinkedList;

import game.PokerPlayer;
import rule.AStraightFlush;
import rule.BFourOfAKind;
import rule.CFullHouse;
import rule.DFlush;
import rule.EStraight;
import rule.FThreeOfAKind;
import rule.GTwoPairs;
import rule.HOnePairOrTwoOfAKind;
import rule.IHighCard;

public class Ranking {

    
    public LinkedList<Node> ranking(ArrayList<PokerPlayer> players){
        LinkedList<Node> playersRank = new LinkedList<>();
        AStraightFlush straightFlush = new AStraightFlush();
        BFourOfAKind fourOfAKind = new BFourOfAKind();
        CFullHouse fullHouse = new CFullHouse();
        DFlush flush = new DFlush();
        EStraight straight = new EStraight();
        FThreeOfAKind threeOfAKind = new FThreeOfAKind();
        GTwoPairs twoPairs = new GTwoPairs();
        HOnePairOrTwoOfAKind onePairOrTwoOfAKind = new HOnePairOrTwoOfAKind();
        IHighCard highCard = new IHighCard();


        for(PokerPlayer p : players){
            if(straightFlush.rule(p)){
                playersRank.add(new Node(1,straightFlush, p,straightFlush.getRuleName()));
            }
            else if(fourOfAKind.rule(p)){
                playersRank.add(new Node(2,fourOfAKind, p, fourOfAKind.getRuleName()));
            }
            else if(fullHouse.rule(p)){
                playersRank.add(new Node(3,fullHouse, p, fullHouse.getRuleName()));
            }
            else if(flush.rule(p)){
                playersRank.add(new Node(4,flush, p,flush.getRuleName()));
            }
            else if(straight.rule(p)){
                playersRank.add(new Node(5,straight, p, straight.getRuleName()));
            }
            else if(threeOfAKind.rule(p)){
                playersRank.add(new Node(6,threeOfAKind, p,threeOfAKind.getRuleName()));
            }
            else if(twoPairs.rule(p)){
                playersRank.add(new Node(7,twoPairs, p,twoPairs.getRuleName()));
            }
            else if(onePairOrTwoOfAKind.rule(p)){
                playersRank.add(new Node(8,onePairOrTwoOfAKind, p, onePairOrTwoOfAKind.getRuleName()));
            }
            else if(highCard.rule(p)){
                playersRank.add(new Node(9,highCard, p,highCard.getRuleName()));
            }
        }
        return playersRank;
    }   
}
