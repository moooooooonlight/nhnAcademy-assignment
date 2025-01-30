public class Test {

    public static void main(String[] args) throws CloneNotSupportedException {
        Book newBook = new Book("book");
        Configuration configuration = new Configuration("Configuration");

        ObjectRepository repository = ObjectRepository.getObjectRepository();
        repository.resist(configuration);
        repository.resist(newBook);

        System.out.println(repository.get(newBook.getClassName()));
        System.out.println(repository.get(newBook.getClassName()));
        System.out.println(repository.get(newBook.getClassName()));

        System.out.println(repository.get(configuration.getClassName()));
    }
}
