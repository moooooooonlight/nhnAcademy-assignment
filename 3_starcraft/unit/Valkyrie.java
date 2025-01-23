package unit;
import atrribute.Flyable;

public class Valkyrie extends Unit implements Flyable{

    public Valkyrie(){
        this.setSpeciesName("Terran");
        this.setName("Valkyrie");
        this.setAttackPowe(4);
        this.setDefencePower(12);
    }
}
