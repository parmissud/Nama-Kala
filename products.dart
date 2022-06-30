import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_pack/Objects/Category.dart';
import 'package:test_pack/productPage.dart';

import 'Objects/Product.dart';

void main() {
  List<Product> products;
bool log;
  String text;
  runApp(Products(products,log,text));
}
class Products extends StatefulWidget {

  List<Product> products;
  bool log;
  String text;
  Products(this.products, bool log, this.text);

  @override
  State<Products> createState() => _ProductsState(products,log,text);
}

class _ProductsState extends State<Products> {
  List<Product> products;
  bool log;
  String text;
  _ProductsState(this.products, this.log,this.text);

  List listCategory;
  void initState(){
    listCategory=[category(products[0].title, products, ' ')];
  }

  // List<Category> listCategory = [
  //   Category(
  //     title: 'Laptop',
  //     listProduct: [
  //       Product(
  //         image: 'images/61Ze2wc9nyS._AC_SX679_.png',
  //         name: 'MSI Pulse GL66 Gaming Laptop',
  //         price:100,
  //
  //       ),
  //       Product(
  //         image: 'images/61G9Yr3n6rL._AC_SX466_.png',
  //         name: 'Newest HP 14" HD Laptop',
  //         price:100,
  //
  //       ),
  //       Product(
  //         image: 'images/81bc8mA3nKL._AC_SX679_.png',
  //         name: 'Acer Nitro 5 AN515-55-53E5 Gaming Laptop',
  //         price:100,
  //
  //       ),
  //     ],
  //   ),
  //
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
                                    child: Column(
                                      children: [
                                        Text(
                                          listCategory[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ), //titr

                                  Container(
                                    height: 500,
                                    child: ListView.builder(
                                      itemCount: listCategory[index].listProduct.length,
                                      scrollDirection: Axis.vertical,
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
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child:
                                                    Image.asset(listCategory[index].listProduct[i].image,width: 150,height: 140,),
                                                ),
                                                Container(
                                                  width: 250,
                                                  alignment: Alignment.bottomLeft,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                    Container(
                                                      child: Text(
                                                        listCategory[index].listProduct[i].name,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      alignment: Alignment.topLeft,
                                                      padding: EdgeInsets.fromLTRB(10,0,0,10),
                                                    ),
                                                      Container(
                                                        child: Text(
                                                          listCategory[index].listProduct[i].price.toString()+' T',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        padding: EdgeInsets.fromLTRB(20,0,0,0),
                                                        alignment: Alignment.bottomLeft,
                                                      ),
                                                  ],
                                                  ),
                                                ),
                                                Container(
                                                  child: TextButton(
                                                    child: Text(
                                                      'buy',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                    Navigator.push(context,
                                                      MaterialPageRoute(builder: (context)=>ProductPage(products[index],log,text)));
                                                },
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                        ); //kalaha
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
}

