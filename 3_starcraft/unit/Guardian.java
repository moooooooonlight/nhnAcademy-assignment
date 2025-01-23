package unit;
import atrribute.Flyable;

public class Guardian extends Unit implements Flyable{

    public Guardian(){
        this.setSpeciesName("Zerg");
        this.setName("Guardian");
        this.setAttackPowe(3);
        this.setDefencePower(6);
    }

    @Override
    public void attack() {

    }
}