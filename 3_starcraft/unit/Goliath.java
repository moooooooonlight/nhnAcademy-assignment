package unit;
import atrribute.FlyAttakable;

public class Goliath extends Unit implements FlyAttakable {
    
    public Goliath(){
        this.setSpeciesName("Terran");
        this.setName("Goliath");
        this.setAttackPowe(5);
        this.setDefencePower(15);
    }
}
