package unit;
import atrribute.FlyAttakable;

public class Hydralisk extends Unit implements FlyAttakable{

    public Hydralisk(){
        this.setSpeciesName("Zerg");
        this.setName("Hydralisk");
        this.setAttackPowe(3);
        this.setDefencePower(7);
    }
}