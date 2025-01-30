package rule;

import game.PokerPlayer;

public abstract class Rule {
    int rank;
    String ruleName;

    abstract boolean rule(PokerPlayer p);

    public void setRuleName(String ruleName){
        this.ruleName = ruleName;
    }

    public String getRuleName(){
        return this.ruleName;
    }

    public void setRank(int rank){
        this.rank = rank;
    }

    public int getRank(){
        return this.rank;
    }
}
