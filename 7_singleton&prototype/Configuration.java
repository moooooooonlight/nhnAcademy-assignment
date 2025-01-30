//@CreationType
@Singleton
public class Configuration implements Resistrable{
    String name;

    public Configuration(String name){
        this.name = name;
    }

    public String getName(){
        return this.name;
    }

    @Override
    public String getClassName() {
        String temp = this.getClass().toString();
        String[] temps =temp.split(" ");
        return temps[temps.length-1];
    }

    @Override
    public Resistrable getInstance() throws CloneNotSupportedException{
        throw new CloneNotSupportedException();
    }
}
