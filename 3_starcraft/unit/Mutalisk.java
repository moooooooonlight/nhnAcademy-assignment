package unit;
import atrribute.Flyable;

public class Mutalisk extends Unit implements Flyable{

    public Mutalisk(){
        this.setSpeciesName("Zerg");
        this.setName("Mutalisk");
        this.setAttackPowe(2);
        this.setDefencePower(8);
    }
}