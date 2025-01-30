// @CreationType(getObjectType=ObjectType.Prototype)
@Prototype
public class Book implements Resistrable{
    String bookName;

    public Book(String bookName){
        this.bookName = bookName;
    }

    public String getName(){
        return this.bookName;
    }

    @Override
    public String getClassName() {
        String temp = this.getClass().toString();
        String[] temps =temp.split(" ");
        return temps[temps.length-1];
    }

    
    @Override
    public Resistrable getInstance() throws CloneNotSupportedException{
        return (Book) super.clone();
    }
}
