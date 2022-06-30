import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;

public class runApp extends Thread{
    int clientPort;
    String clientIp;
     String usersFilePath;
     String productFilePath;
    final int serverPort;
    final String serverIp;
    User_signup user_signup=new User_signup(usersFilePath);
    User_login user_login;
    public runApp(int clientPort, String clientIp, String usersFilePath, String productFilePath, int serverPort, String serverIp) {
        this.clientPort = clientPort;
        this.clientIp = clientIp;
        this.usersFilePath = usersFilePath;
        this.productFilePath = productFilePath;
        this.serverPort = serverPort;
        this.serverIp = serverIp;

    }

    public void run() {
        try {
            File usersFile=new File(usersFilePath);
            File productsFile=new File(productFilePath);
            getInfoFromFile get= new getInfoFromFile(usersFile,productsFile);
            List<user> users=get.listOfUsers;
            List<product> products=get.listOfProducts;
            ServerSocket serverSocket=new ServerSocket(serverPort);
            makeConnection connectToServer=new makeConnection(clientPort,clientIp,serverSocket);
            String command=connectToServer.getInfo();
            user_login=new User_login(users);
            while (!command.contains("closeApp")){

                switch (command.split("_")[0]){
                    case "signup":
                        user_signup.addUser(command);
                        break;
                    case "login":
                        connectToServer.sendInfo(user_login.checkIfUserHasAcc(command));
                        break;
                    case "productPage":

                }

            }
            connectToServer.killSockets();


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
