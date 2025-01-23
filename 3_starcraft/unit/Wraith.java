package unit;
import atrribute.Flyable;

public class Wraith extends Unit implements Flyable {

    public Wraith(){
        this.setSpeciesName("Terran");
        this.setName("Wraith");
        this.setAttackPowe(3);
        this.setDefencePower(10);
    }
}
