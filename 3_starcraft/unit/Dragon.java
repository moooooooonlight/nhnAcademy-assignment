package unit;
import atrribute.FlyAttakable;

public class Dragon extends Unit implements FlyAttakable{

    public Dragon(){
        this.setSpeciesName("Protos");
        this.setName("Dragon");
        this.setAttackPowe(3);
        this.setDefencePower(15);
    }
}