package species;
import unit.Guardian;
import unit.Hydralisk;
import unit.Mutalisk;
import unit.Ultralisk;
import unit.Zergling;

public class Zerg extends Species{
    
    public Zerg(){
        this.speciesName = "Zerg";
        this.units.add(new Zergling());
        this.units.add(new Hydralisk());
        this.units.add(new Ultralisk());
        this.units.add(new Mutalisk());
        this.units.add(new Guardian());
    }   
}
