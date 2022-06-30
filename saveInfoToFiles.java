import java.io.*;

public class saveInfoToFiles {
    private String usersFilePath;
    private String productFilePath;
    private String product;
    private File users;
    private File products;
    private Writer usersWriter;
    private Writer productsWriter;

    public saveInfoToFiles(String usersFilePath) throws IOException {
        this.usersFilePath = usersFilePath;
        users=new File(usersFilePath);
        usersWriter=new FileWriter(users);
    }

    public saveInfoToFiles(String productFilePath, String product) {
        this.productFilePath = productFilePath;
        this.product = product;
    }

    public void  saveUserToFiles(String command) throws IOException {
        String user="user"+command.substring(6,command.length());
        usersWriter.append(user);
    }
    public void saveProductToFiles(String command) throws IOException {
        String product="product"+command.substring(6,command.length());
        productsWriter.append(product);
    }
}
