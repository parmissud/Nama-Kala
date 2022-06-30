import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pack/buying.dart';
import 'package:test_pack/signup.dart';

import 'Objects/Product.dart';

void main() {
  bool log;
  String text;

  Product product;
  runApp( ProductPage(product,log,text));
}

class ProductPage extends StatefulWidget {
  Product product;
  bool log;
  String text;

  ProductPage(this.product, this.log, this.text);

  @override
  State<ProductPage> createState() => _ProductPageState(product,log,text);
}

class _ProductPageState extends State<ProductPage> {
  Product product;
  bool log;
  String text;

  _ProductPageState(this.product, this.log,this.text);

  String dropdownValue;
  String dropdownValue2;
  void initState(){
    dropdownValue = product.availableColors[0];
   dropdownValue2 = product.availableSize[0];}

  // Product product = Product(
  //   image: 'images/61409718cb66ebdb72b65ae3.png',
  //   name: 'Sport Clothing',
  //   category: 'SPORT',
  //   seller: 'ABC',
  //   price: 100,
  //   availableColors: ['red', 'blue'],
  //   availableSize: ['s', 'm', 'l'],
  //   score: 5,
  // );
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
                  image: AssetImage("images/1524295.png"), fit: BoxFit.cover),
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
                            child: Image(
                              width: 100,
                              image: AssetImage(
                                  'images/output-onlinepngtools.png'),
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
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 40,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              product.category,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(product.image, width: 500),
                            SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Seller:  ' + product.seller,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(200,0,0,0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                                Icons.star,
                                                color: Colors.white),
                                            Text('Score:   '+product.score.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                            ),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Price:      ' +
                                    product.price.toString() +
                                    ' T',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text(
                                      'Color:        ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25,
                                      ),
                                    ),
                                    DropdownButton(
                                      value: dropdownValue,
                                      items: product.availableColors
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.color_lens,
                                        color: Colors.white,
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      borderRadius: BorderRadius.zero,
                                      dropdownColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text(
                                      'Size:           ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25,
                                      ),
                                    ),
                                    DropdownButton(
                                      value: dropdownValue2,
                                      items: product.availableSize
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.format_size,
                                        color: Colors.white,
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      borderRadius: BorderRadius.zero,
                                      dropdownColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      'Add to card',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 40),
                    ),
                    onPressed: () {
                      if(log==true){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Buying(product,text)),);
                      }
                      else{
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Sign_up()),);

                      }


                    },
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
