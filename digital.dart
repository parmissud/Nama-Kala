import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_pack/Objects/Category.dart';
import 'package:test_pack/products.dart';

import '../Objects/Product.dart';

void main() {
  category cat;
  bool log;
  String text;
  runApp( Digital(cat,log,text));
}
class Digital extends StatefulWidget {
  category cat;
  bool log;
  String text;

  Digital(this.cat, this.log, this.text);

  @override
  State<Digital> createState() => _DigitalState(log,cat,text);
}

class _DigitalState extends State<Digital> {
  bool log;
  category cat;
  String text;


  _DigitalState(this.log, this.cat, this.text);

  List<category> listCategory ;
  void initState(){
    listCategory = productsInOrder(cat.listProduct);
  }
  //   Category(
  //     title: 'Laptop',
  //     listProduct: [
  //       Product(
  //         image: 'images/61Ze2wc9nyS._AC_SX679_.png',
  //         name: 'MSI Pulse GL66 Gaming Laptop',
  //       ),
  //       Product(
  //         image: 'images/61G9Yr3n6rL._AC_SX466_.png',
  //         name: 'Newest HP 14" HD Laptop',
  //       ),
  //       Product(
  //         image: 'images/81bc8mA3nKL._AC_SX679_.png',
  //         name: 'Acer Nitro 5 AN515-55-53E5 Gaming Laptop',
  //       ),
  //     ],
  //   ),
  //   Category(
  //     title: 'Camera',
  //     listProduct: [
  //       Product(
  //         image:
  //         'images/81HwzslD2oL._AC_SX466_.png',
  //         name: 'Canon EOS R6 Full-Frame Mirrorless Camera with 4K Video',
  //       ),
  //       Product(
  //         image: 'images/61LS5YWKykL._AC_SY355_.png',
  //         name: 'Fujifilm X-Pro3 Mirrorless',
  //       ),
  //       Product(
  //         image: 'images/61PqHR+O5qL._AC_SX466_.png',
  //         name: 'Panasonic LUMIX GH5 4K Digital Camera',
  //       ),
  //     ],
  //   ),
  //   Category(title: 'Mobile phone',
  //       listProduct: [
  //     Product(image: 'images/iphone-13-pro-max-silver-select.png',
  //       name: 'iphone-13-pro-max-silver-select',),
  //   ],
  // ),
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
                                    height: 300,
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
        case "Phone":
          listPhoneProducts.add(products[i]);
          break;
        case "Camera":
          listCameraProducts.add(products[i]);
          break;
        case "Laptop":
          listLaptopProducts.add(products[i]);
          break;
      }
    }
    List<category> listTitle=[category("Phone",listPhoneProducts,''),
      category("Laptop", listLaptopProducts, ''),
      category("Camera", listCameraProducts, ''),
    ];
    return listTitle;

  }
}

