
import java.io.IOException;

public class User_signup {
    String usersFilePath;

    public User_signup(String usersFilePath) {
        this.usersFilePath = usersFilePath;
    }

    public void addUser(String command) throws IOException {
        saveInfoToFiles saveUser=new saveInfoToFiles(usersFilePath);
        saveUser.saveUserToFiles(command);
    }
}
