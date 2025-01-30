import java.util.HashMap;
import java.util.Map;

public class ObjectRepository {

    Map<String,Resistrable> map = new HashMap<>();
    static ObjectRepository objectRepository;

    private ObjectRepository(){}

    public static ObjectRepository getObjectRepository(){
        if(objectRepository == null){
            objectRepository = new ObjectRepository();
        }
        return objectRepository;
    }

    public void resist(Resistrable s){
        this.map.putIfAbsent(s.getClassName(),s);
    }

    public Resistrable get(String name) throws CloneNotSupportedException{
        Resistrable object = map.get(name); 

        if(object instanceof Prototype){
            return object.getInstance();
        }else{
            return object;
        }
    }
}


