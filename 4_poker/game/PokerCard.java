package game;

public class PokerCard implements Comparable<PokerCard>{
    int number;
    String displayNumber;
    int rank;
    String shape;

    public PokerCard(int number, String displayNumber, int rank, String shape){
        this.number = number;
        this.displayNumber = displayNumber;    
        this.rank = rank;
        this.shape = shape;
    }

    public void setNumber(int number){
        this.number = number;
    }

    public int getNumber(){
        return this.number;
    }

    public void setDisplayNumber(String displayNumber){
        this.displayNumber = displayNumber;
    }

    public String getDisplayNumber(){
        return this.displayNumber;
    }

    public void setRank(int rank){
        this.rank = rank;
    }

    public int getRank(){
        return this.rank;
    }

    public void setShape(String shape){
        this.shape = shape;
    }

    public String getShape(){
        return this.shape;
    }


    @Override
    public int compareTo(PokerCard o) {
        return o.number-this.number;
    }   
}