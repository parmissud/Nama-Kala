import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class product {
    private String image;
    private String name;
    private String category;
    private String seller;
    private String price;
    private List<String> availableColors;
    private List<String> availableSize;
    private String score;
    private String  number;
    private String color;
    private String size;
    private String title;

    public product(String image, String name, String category, String seller,String price, List<String> availableColors, List<String> availableSize, String  score,String number, String color, String size, String title) {
        this.image = image;
        this.name = name;
        this.category = category;
        this.seller = seller;
        this.price = price;
        this.availableColors = availableColors;
        this.availableSize = availableSize;
        this.score = score;
        this.number = number;
        this.color = color;
        this.size = size;
        this.title = title;
    }

    @Override
    public String toString() {
        return "product" +
                "_"+image +
                "_"+name +
                "_"+ category +
                "_"+ seller +
                "_"+ price +
                "_"+availableColors +
                "_"+ availableSize +
                "_"+ score+
                "_"+number+
                "_"+color+
                "_"+size+
                "_"+title+
                "_end\n" ;
    }
}
