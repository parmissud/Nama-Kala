import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class makeConnection {
    Socket sendingSocket;
    Socket recievingSocket;
    int clientPort;
    String clientIp;
    ServerSocket serverSocket;

    public makeConnection(int clientPort, String clientIp,ServerSocket serverSocket) throws IOException {
        this.clientPort = clientPort;
        this.clientIp = clientIp;
        this.serverSocket=serverSocket;
        sendingSocket=new Socket(clientIp,clientPort);
        recievingSocket=serverSocket.accept();
    }
    public void killSockets() throws IOException {
        sendingSocket.close();
        recievingSocket.close();
    }
    public void sendInfo(String info){
        try {
            DataOutputStream outputStream=new DataOutputStream(sendingSocket.getOutputStream());
            outputStream.writeUTF(info);
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public String getInfo() throws IOException {
            DataInputStream dataInputStream=new DataInputStream(recievingSocket.getInputStream());
            String data=dataInputStream.readUTF();
            return data;


    }
}
