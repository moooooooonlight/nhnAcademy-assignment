package species;
import java.util.ArrayList;

import unit.Unit;

public class Species{
    String speciesName;
    ArrayList<Unit> units;

    public Species(){
        units = new ArrayList<>();
    }
    
    public void setUnits(ArrayList<Unit> units){
        this.units = units;
    }

    public ArrayList<Unit> getUnits(){
        return this.units;
    }

    public void setSpeciesName(String speciesName){
        this.speciesName = speciesName;
    }

    public String getsetSpeciesName(){
        return this.speciesName;
    }   
}