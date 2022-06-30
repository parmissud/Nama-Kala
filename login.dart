import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_pack/signup.dart';
import 'package:test_pack/homepage.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: log_in(),
  ));
}

class log_in extends StatefulWidget {
  const log_in({Key key}) : super(key: key);

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  final _phoneKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool hasAcc=false;
  bool logedIn=false;

  bool pass = true;
  changePass() {
    setState(() {
      pass = !pass;
    });
  }

  @override
  Widget build(BuildContext context) {

    bool _isObscure = true;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Homepage(false," ")));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            'Log In ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
              child: Image(
                image: AssetImage('images/output-onlinepngtools.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Form(
                key: _phoneKey,
                child: TextFormField(
                  controller: phoneNumberController,
                    validator: (value) {
                      if (value== null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
              padding: EdgeInsets.fromLTRB(0, 24.01, 0, 0),
              child: Form(
                key: _passKey,
                child: TextFormField(
                  controller: passController,
                    validator: (value) {
                      if (value== null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  style: TextStyle(color: Colors.white),
                  obscureText: pass,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Enter Text Here",
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
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 50),
              height: 40,
              width: 200,
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(0)),
              child: TextButton(
                onPressed: () {
                  if(_phoneKey.currentState.validate() & _passKey.currentState.validate()){
                  String command="login_"+phoneNumberController.text+"_"+passController.text;
                  sendAndGet(command);
                  if(hasAcc==true){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage(logedIn,phoneNumberController.text)));}
                  else{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage(true, phoneNumberController.text)));
                  }
                }
    },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0)),
              Text('Does not have account?',style:TextStyle(color: Colors.white)),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Sign_up()),);
                    },
                  )
          ],
      ),
    ),
    );
  }
  sendAndGet(String command) async{
    await Socket.connect('10.0.2.2', 8000).then((serverSocket) {
      serverSocket.write(command);
      serverSocket.flush();
      serverSocket.listen((response) {
        String s=String.fromCharCodes(response);
        setState((){
          if(s=="true")
            hasAcc=true;
          logedIn=true;
        });


      });
    });
  }
}
