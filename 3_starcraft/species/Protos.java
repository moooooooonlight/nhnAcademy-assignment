package species;

import unit.Corsair;
import unit.Dragon;
import unit.HighTempler;
import unit.Scout;
import unit.Zealot;

public class Protos extends Species{
        
    public Protos(){
        this.speciesName = "Protos";
        this.units.add(new Zealot());
        this.units.add(new Dragon());
        this.units.add(new HighTempler());
        this.units.add(new Scout());
        this.units.add(new Corsair());
    }
}
