public interface Resistrable {
    String getClassName();
    Resistrable getInstance() throws CloneNotSupportedException;
}
