package unit;
import atrribute.Flyable;

public class Scout extends Unit implements Flyable{

    public Scout(){
        this.setSpeciesName("Protos");
        this.setName("Scout");
        this.setAttackPowe(5);
        this.setDefencePower(10);
    }

    @Override
    public void attack() {
        
    }
}