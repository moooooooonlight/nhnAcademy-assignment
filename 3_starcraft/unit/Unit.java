package unit;
import species.Species;

public class Unit extends Species{
    String unitName;
    int attackPower;
    int defencePower;
    int no;
    int flyable;
    int flyAttackable;

    public Unit(){}
    public Unit(String unitName, int attackPower, int defencePower){
        this.unitName = unitName;
        this.attackPower = attackPower;
        this.defencePower = defencePower;
    }
    public Unit(Unit unit){
        this.unitName = unit.unitName;
        this.attackPower = unit.attackPower;
        this.defencePower = unit.defencePower;
        this.no = unit.no;
        this.flyable = unit.flyable;
        this.flyAttackable = unit.flyAttackable;
    }

    public void setNo(int no){
        this.no = no;
    }

    public int getNo(){
        return this.no;
    }


    public void setName(String unitName){
        this.unitName = unitName;
    }

    public String getName(){
        return this.unitName;
    }

    public void setAttackPowe(int attackPower){
        this.attackPower = attackPower;
    }

    public int getAttackPower(){
        return this.attackPower;
    }

    public void setDefencePower(int defencePower){
        this.defencePower = defencePower;
    }

    public int getDefencePower(){
        return this.defencePower;
    }

    public void attack() {
        System.out.println();
    }

    @Override
    public String toString(){
        StringBuffer result = new StringBuffer();
        result.append(unitName);
        result.append(" (현재 방어력: "+ this.defencePower);
        result.append(", 공격력: " + this.attackPower+")");
        return result.toString();
    }
}
