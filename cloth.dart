import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_pack/products.dart';
import '../Objects/Category.dart';
import '../Objects/Product.dart';
import '../buying.dart';
import '../productPage.dart';


void main() {
  bool log;
  String text;
  category cat;
  runApp( Cloth(cat,log,text));
}
class Cloth extends StatefulWidget {
  category cat;
  bool log;
  String text;

  Cloth(this.cat, this.log, this.text);


  @override
  State<Cloth> createState() => _ClothState(cat,log,text);
}

class _ClothState extends State<Cloth> {
  category cat;
  bool log;
  String text;

  _ClothState(this.cat, this.log,this.text);

  List<category> listCategory ;
  void initState(){
    listCategory=productsInOrder(cat.listProduct);
  }
    // Category(
    //   title: 'Women',
    //   listProduct: [
    //     Product(
    //       image: 'images/JadenSmithLouisVuitton-20160104112504174.png',
    //       name: 'JadenSmithLouisVuitto',
    //     )
    //   ],
    // ),
  //   Category(
  //     title: 'Kid',
  //     listProduct: [
  //       Product(
  //         image:
  //         'images/Browns-Kidswear-2021.png',
  //         name: 'Browns-Kidswear',
  //       )
  //     ],
  //   ),
  //   Category(title: 'Men',
  //     listProduct: [
  //       Product(image: 'images/00_story.png',
  //         name: 'Vogue Spring 2020 Menswear',),
  //     ],
  //   ),


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/1524295.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    autofocus: false,
                    decoration: InputDecoration(
                      isDense:
                      true, //Whether the InputDecorator.child is part of a dense form (i.e., uses less vertical space). Defaults to false.
                      filled:
                      true, //If true the decoration's container is filled with fillColor.
                      fillColor: Colors.black,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 6,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      suffixIcon: Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(
                            CupertinoIcons.search,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 2),
                          Container(
                            margin: EdgeInsets.fromLTRB(100, 1, 0, 1),
                            child:  Image(
                              width: 100,
                              image: AssetImage('images/output-onlinepngtools.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                            children: List.generate(listCategory.length, (index) {
                              return Column(
                                children: [
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          listCategory[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        TextButton(
                                          child: const Text(
                                            'See more',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>Products(listCategory[index].listProduct,log,text)));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: listCategory[index].listProduct.length,
                                      scrollDirection: Axis.horizontal,
                                      reverse: true,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Container(
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    child:
                                                    Image.asset(listCategory[index].listProduct[i].image,width: 150,height: 140,)
                                                  // Image(
                                                  //   image: AssetImage(listCategory[index]
                                                  //       .listProduct[i]
                                                  //       .image),
                                                  //   width: 80,
                                                  // ),
                                                ),
                                                Text(
                                                  listCategory[index].listProduct[i].name,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              );
                            })),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<category> productsInOrder(List<Product> products){
    List<Product> listPhoneProducts;
    List<Product> listLaptopProducts;
    List<Product> listCameraProducts;
    for(int i=0;i<products.length;i++){
      switch(products[i].title){
        case "Women":
          listPhoneProducts.add(products[i]);
          break;
        case "Kid":
          listCameraProducts.add(products[i]);
          break;
        case "Men":
          listLaptopProducts.add(products[i]);
          break;
      }
    }
    List<category> listTitle=[category("Women",listPhoneProducts,''),
      category("Kid", listLaptopProducts, ''),
      category("Men", listCameraProducts, ''),
    ];
    return listTitle;

  }
}

