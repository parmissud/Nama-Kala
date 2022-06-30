import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Selling());
}
class Selling extends StatefulWidget {
  const Selling({Key key}) : super(key: key);

  @override
  State<Selling> createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  List<String> dropdownValues=['Sport','Stationary','Digital','Cloth'];
  String dropdownValue;
  void initState(){
  dropdownValue=dropdownValues.first;
}

  bool validate=true;

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
            child: Container(
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.black,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(

                                labelText: 'Image url',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(110, 20, 100, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Category:           ',
                                    style: TextStyle(
                                      color: Colors.white,

                                    ),
                                  ),
                                  DropdownButton(
                                    value: dropdownValue,
                                    items: dropdownValues
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
                                    style: TextStyle(color: Colors.white),
                                    borderRadius: BorderRadius.zero,
                                    dropdownColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(

                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  labelText: 'Shop name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: 'Price',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: 'Size',
                                hintText: 'Type availabe size,put space between them(exp:32 33 34)',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                              ),

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: 'Colors',
                                hintText: 'Type availabe colors,put space between them(exp:red blue green)',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                              ),

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: 'Number of available products',
                                hintText: 'Type availabe numbers',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                              ),

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value== null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 100,bottom: 100),
                            height: 40,
                            width: 200,
                            padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(0)),
                            child: TextButton(
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => Homepage()));
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

