import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_pack/homepage.dart';
import 'package:test_pack/login.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sign_up(),
  ));
}
class Sign_up extends StatefulWidget {
  const Sign_up({Key key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

  bool pass = true;
  TextEditingController nameController= TextEditingController();
  TextEditingController familyNameController= TextEditingController();
  TextEditingController phoneNumberController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController companyController= TextEditingController();

  final _nameKey = GlobalKey<FormState>();
  final _familyNameKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();


  changePass() {
    setState(() {
      pass = !pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('Sign Up',style: TextStyle(color: Colors.black),),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: Image(
                      image: AssetImage('images/output-onlinepngtools.png'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _nameKey,
                      child: TextFormField(
                        controller: nameController,
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
                          )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      key: _familyNameKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value== null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: familyNameController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            labelText: 'Family Name',
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      key: _phoneKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value== null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: phoneNumberController,

                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      key: _passKey,
                      validator: (value) {
                        if (value== null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                          RegExp exp=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                        if(!exp.hasMatch(value)){
                            return 'Please enter an acceptable password';
                        }
                        return null;
                        },
                      controller: passwordController,

                      style: TextStyle(color: Colors.white),
                      obscureText: pass,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffix: IconButton(
                          onPressed: changePass,
                          icon: Icon(
                              pass == true ? Icons.remove_red_eye : Icons.password,
                              color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: TextField(
                      controller:emailController ,

                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Email Adrdress',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                    child: TextField(
                      controller:companyController ,

                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Company\'s name',
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

                          if (_nameKey.currentState.validate()&
                          _familyNameKey.currentState.validate() &
                          _phoneKey.currentState.validate() &
                          _passKey.currentState.validate()) {
                            String command = "signup_" + nameController.text +
                                "_" + familyNameController.text + "_" +
                                passwordController.text + "_" +
                                emailController.text + "_" +
                                companyController.text + "_end\n";
                            send(command);
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => log_in()));
                          }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),),
    );
  }
  send(String command) async{
    await Socket.connect("10.0.2.2",8000).then((serverSocket){
      serverSocket.write(command);
      serverSocket.flush();
    });
  }
}

