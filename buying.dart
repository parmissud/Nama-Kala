import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_pack/homepage.dart';

import '../Objects/Product.dart';
import '../Objects/Category.dart';
import '../Objects/User.dart';
import 'StringToList.dart';

void main() {
  Product p;
  String text;
  runApp(Buying(p,text));
}
class Buying extends StatefulWidget {
  Product p;
  String text;
  Buying(this.p, this.text);

  @override
  State<Buying> createState() => _BuyingState(p,text);
}

class _BuyingState extends State<Buying> {
  Product p;
  String text;
  String preProducts;
  List<Product> listProduct;
  String s;
  int totalPrice=0;
  _BuyingState(this.p,this.text);

  void initState() {

    String command='buying_userPhoneNumber_ $text _end\n';
    sendAndGet(command);
    listProduct=stringToProduct(s);
    listProduct.add(p);
    for(int i=0;i<listProduct.length;i++){
      totalPrice+=int.parse(listProduct[i].price);
    }
  }


  sendAndGet(String command) async{
    await Socket.connect('10.0.2.2', 8000).then((serverSocket) {
      serverSocket.write(command);
      serverSocket.flush();
      serverSocket.listen((response) {
        s=String.fromCharCodes(response);
      });
    });}
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
// List<Product> listProduct=[
  // Product(
  //   image: 'images/61409718cb66ebdb72b65ae3.png',
  //   name: 'Sport Clothing',
  //   category: 'SPORT',
  //   seller: 'ABC',
  //   price: 100,
  //   color: 'red',
  //   size: 's',
  //   score: 5,
  // ),
  // Product(
  //   image: 'images/61409718cb66ebdb72b65ae3.png',
  //   name: 'Sport Clothing',
  //   category: 'SPORT',
  //   seller: 'ABC',
  //   price: 100,
  //   color: 'red',
  //   size: 's',
  //   score: 5,
  // )
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
                            children: List.generate(listProduct.length, (index) {
                              return Column(
                                children: [
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Basket',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ), //titr

                                  Container(
                                    height: 400,
                                    child: ListView.builder(
                                      itemCount: listProduct.length,
                                      scrollDirection: Axis.vertical,
                                      reverse: true,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            margin: EdgeInsets.all(20),
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child:
                                                  Image.asset(listProduct[i].image,width: 150,height: 140,),
                                                ),
                                                Container(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          listProduct[i].name,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        alignment: Alignment.topLeft,
                                                        padding: EdgeInsets.fromLTRB(10,0,0,10),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Color: '+listProduct[i].color,
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        alignment: Alignment.topLeft,
                                                        padding: EdgeInsets.fromLTRB(10,0,0,10),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Size: '+listProduct[i].size,
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        alignment: Alignment.topLeft,
                                                        padding: EdgeInsets.fromLTRB(10,0,0,10),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          listProduct[i].price.toString()+' T',
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontWeight: FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        padding: EdgeInsets.fromLTRB(10,0,0,0),
                                                        alignment: Alignment.bottomLeft,
                                                      ),

                                                    ],
                                                  ),
                                                ),

                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: TextButton(
                                                    child: Text(
                                                      'Delet',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      listProduct.remove(listProduct[index]);
                                                      Navigator.push(context,
                                                          MaterialPageRoute(builder: (context) => Buying(null, text)));
                                                    },
                                                  ),
                                                )
                                              ],

                                            ),
                                          ),
                                        ); //kalaha
                                      },
                                    ),
                                  ),
                                      Container(
                                        width: double.infinity,
                                        child: Row(

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Total Price: '+totalPrice.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                ),
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                  fontWeight:FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  send('buying_ $text _ $p _end');
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => Homepage(true, text)));
                                                },
                                              ),
                                              alignment: Alignment.topRight,
                                              margin: EdgeInsets.fromLTRB(150,0,10,0),
                                            ),
                                          ],
                                        ),
                                        color: Colors.white,
                                      ),
                                ],
                              );
                            })
                          ,),

                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  send(String command) async{
    await Socket.connect('10.0.2.2', 8000).then((serverSocket) {
      serverSocket.write(command);
      serverSocket.flush();
    });}


}



