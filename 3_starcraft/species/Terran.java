package species;
import unit.Goliath;
import unit.Marine;
import unit.Tank;
import unit.Valkyrie;
import unit.Wraith;

public class Terran extends Species{
    
    public Terran(){
        this.speciesName = "Terran";
        this.units.add(new Marine());
        this.units.add(new Tank());
        this.units.add(new Goliath());
        this.units.add(new Wraith());
        this.units.add(new Valkyrie());
    }
}
