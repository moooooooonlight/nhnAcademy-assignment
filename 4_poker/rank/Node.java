package rank;

import java.util.LinkedList;

import game.PokerCard;
import game.PokerPlayer;
import rule.Rule;

// 플레이어 및 게임 결과 및 승리한 카드 list.
public class Node implements Comparable<Node>{
    int rank;
    Rule rule;
    String ruleName;
    PokerPlayer player;
    LinkedList<PokerCard> list = new LinkedList<>();

    public Node(int rank, Rule rule, PokerPlayer player, String ruleName){
        this.rule = rule;
        this.rank = rank;
        this.player = player;
        this.ruleName = ruleName;
    }

    public String getRuleName(){
        return this.ruleName; 
    }

    public int getRank(){
        return this.rank; 
    }

    public Rule getRule(){
        return this.rule; 
    }

    public PokerPlayer getPlayer(){
        return this.player; 
    }

    public LinkedList<PokerCard> getList(){
        return this.list;
    }

    @Override
    public int compareTo(Node o) {
        if(this.rank - o.rank == 0){
            if(o.rule.getRuleName().equals("highCard")){
                return o.player.getVictory().get(0).getRank() - this.player.getVictory().get(0).getRank();
            }else if(o.rule.getRuleName().equals("onePairOrTwoOfAKind")){
                return o.player.getVictory().get(0).getRank() - this.player.getVictory().get(0).getRank();
            }else if(o.rule.getRuleName().equals("twoPairs")){
                if(o.player.getVictory().get(0).getRank() == this.player.getVictory().get(0).getRank()){
                    return o.player.getVictory().get(3).getRank() - this.player.getVictory().get(3).getRank();
                }
                return o.player.getVictory().get(0).getRank() - this.player.getVictory().get(0).getRank();
            }else if(o.rule.getRuleName().equals("threeOfAKind")){
                return o.player.getVictory().get(0).getNumber() - this.player.getVictory().get(0).getNumber();
            }else if(o.rule.getRuleName().equals("straight")){
                return o.player.getVictory().get(0).getNumber() - this.player.getVictory().get(0).getNumber();
            }else if(o.rule.getRuleName().equals("flush")){
                return o.player.getVictory().get(0).getNumber() - this.player.getVictory().get(0).getNumber();
            }else if(o.rule.getRuleName().equals("fullHouse")){
                return o.player.getVictory().get(0).getNumber() - this.player.getVictory().get(0).getNumber();
            }else if(o.rule.getRuleName().equals("fourOfAKind")){
                return o.player.getVictory().get(0).getNumber() - this.player.getVictory().get(0).getNumber();
            }else if(o.rule.getRuleName().equals("straightFlush")){
                return o.player.getVictory().get(0).getNumber() - this.player.getVictory().get(0).getNumber();
            }
        }
        return this.rank - o.rank;
    }
}