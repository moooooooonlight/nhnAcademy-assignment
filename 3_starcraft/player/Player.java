package player;
import java.util.Random;

import species.Species;
import unit.Unit;

import java.util.LinkedList;

public class Player {
    Species species;
    int size;
    LinkedList<Unit> units;
    
    public Player(int size, Species species){
        this.size = size;
        this.species = species;
        units = new LinkedList<>();
        
        // 랜덤 유닛 객체 만들어주기.
        int index = 0;
        while(index < this.size){
            Random random = new Random();
            int randomNo = random.nextInt(this.species.getUnits().size());    
            this.units.add(newInstance(this.species.getUnits().get(randomNo)));
            this.units.get(index).setNo(index);
            index++;
        }
    }

    public void setUnits(LinkedList<Unit> units){
        this.units = units;
    }

    public LinkedList<Unit> getUnits(){
        return this.units;
    }

    public void setSpeciesName(Species species){
        this.species = species;
    }

    public Species getsetSpeciesName(){
        return this.species;
    }   

    public void setSize(int size){
        this.size = size;
    }

    public int getSize(){
        return this.size;
    }   

    public static Unit newInstance(Unit unit) {
        return new Unit(unit);
    }
}
