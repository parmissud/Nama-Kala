import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pack/buying.dart';

import 'Objects/Product.dart';
import 'Objects/User.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Product product = Product(
     'images/61409718cb66ebdb72b65ae3.png',
    'Sport Clothing',
     'SPORT',
     'ABC',
     '100',
     ['red', 'blue'],
     ['s', 'm', 'l'],
     '5',
    '10',
    'red',
    's',
    'sporth clothing'
  );
  User user;
  void initState() {
    user = User(
        'name',
        'pass',
        'FamilyName',
        'phoneNumber',
        'email',
        [product],
        [product],
        [product],
        [product],
        );
  }
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Image(
                                    image: AssetImage('images/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png'),
                                fit: BoxFit.cover)),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              user.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.familyName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.phoneNumber,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.email,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.byedProducts.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.soldProducts.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              user.favorites.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

