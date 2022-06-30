import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Objects/Category.dart';
import 'Objects/Product.dart';
import 'StringToList.dart';
import 'categories/cloth.dart';
import 'categories/digital.dart';
import 'categories/sport.dart';
import 'categories/stationary.dart';
import 'login.dart';

void main() {
  bool log;
  String text;
  runApp( Homepage(log,text));
}

class Homepage extends StatefulWidget {
  bool log;
  String text;
  Homepage(this.log, String text);

  @override
  State<Homepage> createState() => _HomepageState(log,text);
}

class _HomepageState extends State<Homepage> {
  bool log;
  String text;


  _HomepageState(this.log, this.text);

  List<Product> products;
  List<category> listCategory;

  void initState(){
    listCategory =productsInOrder(products);
  }
    // digital(
    //   address: 'test_pack/digital.dart',
    //   title: 'Digital',
    //   listProduct: [
        // Product(
        //   image: 'images/iphone-13-pro-max-silver-select.png',
        //   name: 'Mobile phone',
        // ),
        // Product(
        //   image: 'images/0822-m007-25-as74430549-camera.png',
        //   name: 'Camera',
        // ),
        // Product(
        //   image: 'images/photo-1517336714731-489689fd1ca8.png',
        //   name: 'Laptop',
        // ),
    //   ],
    // ),
  //   cloth(
  //     address: 'test_pack/cloth.dart',
  //     title: 'Cloths',
  //     listProduct: [
  //       Product(
  //         image:
  //             'images/JadenSmithLouisVuitton-20160104112504174.png',
  //         name: 'Women',
  //       ),
  //       Product(
  //         image: 'images/Browns-Kidswear-2021.png',
  //         name: 'Kid',
  //       ),
  //       Product(
  //         image: 'images/00_story.png',
  //         name: 'Men',
  //       ),
  //     ],
  //   ),
  //   stationary(title: 'Stationary',
  //       address: 'test_pack/stationary.dart',
  //       listProduct: [
  //     Product(image: 'images/teenbundle.png', name: 'Books'),
  //     Product(image: 'images/download (1).png', name: 'Stationary'),
  //     Product(
  //         image: 'images/JU5TDMCDQWSEJL3UXCENYO26HY.png',
  //         name: 'Musical Instruments'),
  //     Product(
  //         image: 'images/adult-craft-ideas-1643411791.png',
  //         name: 'Craft')
  //   ]),
  //   sport(
  //       address: 'test_pack/lib/sport.dart',
  //       title: 'Travel & Sports', listProduct: [
  //     Product(
  //         image: 'images/61409718cb66ebdb72b65ae3.png',
   //         name: 'Sport Clothing'),
  //     Product(
  //         image: 'images/download (2).png', name: 'Sport Equipment'),
  //     Product(image: 'images/960x0.png', name: 'Camp Equipment')
  //   ])
  // ];

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
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => log_in()));
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
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
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>listCategory[index].doFunc(listCategory[index],log,text)));

                                    },
    )

                                    // listCategory[index].doFunc;}


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
  sendAndGet(String command) async{
    await Socket.connect('10.0.2.2', 8000).then((serverSocket) {
      serverSocket.write(command);
      serverSocket.flush();
      serverSocket.listen((response) {
        setState((){
          products=stringToProduct(String.fromCharCodes(response));
        });
      });
    });
  }
  List<Product> stringToProduct(String str){
    StringToList strToList;
    List<Product> products;
    for(int i=0;i<str.split("end").length;i++){
      products?.add(Product(str.split("_end")[i].split("_")[1],
          str.split("_end")[i].split("_")[2],
          str.split("_end")[i].split("_")[3],
          str.split("_end")[i].split("_")[4],
          str.split("_end")[i].split("_")[5],
          strToList?.stringToList(str.split("_end")[i].split("_")[6]),
          strToList?.stringToList(str.split("_end")[i].split("_")[7]),
          str.split("_end")[i].split("_")[8],
          str.split("_end")[i].split("_")[9],
          str.split("_end")[i].split("_")[10],
          str.split("_end")[i].split("_")[11],
          str.split("_end")[i].split("_")[12],
      ));
    }
    return products;
  }
  List<category> productsInOrder(List<Product> products){
    List<Product> listDigitalProducts;
    List<Product> listSportProducts;
    List<Product> listStationaryProducts;
    List<Product> listClothProducts;
    if(products==null)
      return [];
    for(int i=0;i<products.length;i++){
      switch(products[i].category){
        case "Digital":
          listDigitalProducts?.add(products[i]);
          break;
        case "Cloth":
          listClothProducts?.add(products[i]);
          break;
        case "Sport":
          listSportProducts?.add(products[i]);
          break;
        case "Stationary":
          listStationaryProducts?.add(products[i]);
          break;
      }
    }
    List<category> listCategory=[category("Digital",listDigitalProducts,'test_pack/lib/categories/digital.dart'),
    category("Sport and Travelling", listSportProducts, 'test_pack/lib/categories/sport.dart'),
    category("Stationary", listStationaryProducts, 'test_pack/lib/categories/stationary.dart'),
    category("Cloth", listClothProducts, 'test_pack/lib/categories/cloth.dart'),
    ];
    return listCategory;

   }

}

class digital extends category{
  String address;
  String title;
  List<Product> listProduct;
  digital(this.address, this.title, this.listProduct) : super('', null, '');

  Widget doFunc(category cat,  bool log,String text){
    return Digital(cat,log, text);
  }
}
class cloth extends category {
  String address;
  String title;
  List<Product> listProduct;

  cloth(this.address, this.title, this.listProduct) : super('', null, '');

  Widget doFunc(category cat,  bool log,String text){
    return Cloth(cat,log,text);
  }
}
class stationary extends category {
  String address;
  String title;
  List<Product> listProduct;

  stationary(this.address, this.title, this.listProduct) : super('', null, '');

  Widget doFunc(category cat,  bool log,String text){
   return Statinary(cat,log,text);
  }
}
class sport extends category{
  String address;
  String title;
  List<Product> listProduct;

  sport(this.address, this.title, this.listProduct) : super('', null, '');

  Widget doFunc(category cat,  bool log,String text){
    return Sport(cat,log,text);
  }
}


