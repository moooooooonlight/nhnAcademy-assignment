package unit;
import atrribute.Flyable;

public class Corsair extends Unit implements Flyable{

    public Corsair(){
        this.setSpeciesName("Protos");
        this.setName("Corsair");
        this.setAttackPowe(4);
        this.setDefencePower(12);
    }
}