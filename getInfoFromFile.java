import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class getInfoFromFile {
    File users;
    File products;
    Reader readUsersFromFile=new FileReader(users);
    Reader readProductsFromFile=new FileReader(products);
    List<user> listOfUsers=new ArrayList<>();
    List<product> listOfProducts=new ArrayList<>();
    public getInfoFromFile(File users, File products) throws FileNotFoundException {
        this.users = users;
        this.products = products;
    }
    public List<user> getUsers(){
        Scanner sc=new Scanner(readUsersFromFile);
        String fileUsers=new String();
        while (sc.hasNext()){
            fileUsers+=sc.nextLine();
        }
        int numOfUsers=fileUsers.split("end").length;
        for (int i = 0; i < numOfUsers; i++) {
            stringToList byed=new stringToList(fileUsers.split("end")[i].split("_")[6]);
            stringToList sold =new stringToList(fileUsers.split("end")[i].split("_")[7]);
            stringToList basket =new stringToList(fileUsers.split("end")[i].split("_")[8]);

            stringToList favorites=new stringToList(fileUsers.split("end")[i].split("_")[9]);
            user u=new user(fileUsers.split("end")[i].split("_")[1],
                    fileUsers.split("end")[i].split("_")[2],
                    fileUsers.split("end")[i].split("_")[3],
                    fileUsers.split("end")[i].split("_")[4],
                    fileUsers.split("end")[i].split("_")[5],
                    byed.theStringToListMethod(),
                    sold.theStringToListMethod(),
                    basket.theStringToListMethod(),
                    favorites.theStringToListMethod());
            listOfUsers.add(u);
        }
        return listOfUsers;
    }
    public List<product> getProducts(){
        Scanner sc=new Scanner(readProductsFromFile);
        String fileProducts=new String();
        while (sc.hasNext()){
            fileProducts+=sc.nextLine();
        }
        int numOfProducts=fileProducts.split("end").length;
        for (int i = 0; i < numOfProducts; i++) {
            stringToList colors=new stringToList(fileProducts.split("end")[i].split("_")[6]);
            stringToList size=new stringToList(fileProducts.split("end")[i].split("_")[7]);
            product p=new product(fileProducts.split("end")[i].split("_")[1],
                    fileProducts.split("end")[i].split("_")[2],
                    fileProducts.split("end")[i].split("_")[3],
                    fileProducts.split("end")[i].split("_")[4],
                    Integer.parseInt(fileProducts.split("end")[i].split("_")[5]),
                    colors.theStringToListMethod(),
                    size.theStringToListMethod(),
                    Integer.parseInt(fileProducts.split("end")[i].split("_")[8]),
                    Integer.parseInt(fileProducts.split("end")[i].split("_")[9])),
            Integer.parseInt(fileProducts.split("end")[i].split("_")[10])),
            Integer.parseInt(fileProducts.split("end")[i].split("_")[11]));
            listOfProducts.add(p);
        }
        return listOfProducts;
    }
    class stringToList{
        String list;

        public stringToList(String list) {
            this.list = list;
        }

        List theStringToListMethod(){
            List res=new ArrayList();
            String replace=list.replace("[","");
            list=replace;
            replace=list.replace("]","");
            list=replace;
            for (int i = 0; i < list.split(", ").length; i++) {
                res.add(list.split(", ")[i]);
            }
            return res;

        }
    }
}
