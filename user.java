import java.util.List;

public class user {
    String name;
    String pass;
    String familyName;
    String phoneNumber;
    String email;
    List<product> byedProducts;
    List<product> soldProducts;
    List<product> basket;
    List<product> favorites;

    public user(String name,String FamilyName,  String pass, String phoneNumber, String email, List<product> byedProducts, List<product> selledProducts,List<product> basket, List<product> favorites) {
        this.name = name;
        this.pass=pass;
        this.familyName=FamilyName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.byedProducts = byedProducts;
        this.soldProducts = selledProducts;
        this.basket=basket;
        this.favorites = favorites;
    }

    @Override
    public String toString() {
        return "user"+"_"+
                name+"_"+
                familyName + "_"  +
                pass+"_"+
                phoneNumber + "_" +
                email + "_" +
                byedProducts +"_" +
                soldProducts +"_" +
                basket+"_"+
                favorites+"_end\n" ;
    }
}
