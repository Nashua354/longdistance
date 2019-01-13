import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:longdistance/components/drawer.dart';
import 'package:longdistance/firebase/firebaseService.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String uid = '';

  getUid() {}

  @override
  // void initState() {
  //   this.uid = '';
  //   FirebaseAuth.instance.currentUser().then((val) {
  //     setState(() {
  //       this.uid = val.uid;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  //   super.initState();
  // }
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you want to exit the App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => exit(0),
                ),
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
          //drawer: AppDrawer('Dashboard'),
          appBar: new AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
              child: Hero(
                tag: 'settings',
                child: Icon(Icons.settings),
              ),
            ),
            // automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.all(6.0),
              child: Hero(
                tag: 'logoHero',
                child: Image.asset('assets/images/Logo.png'),
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('You are now logged in as uid'),
                  SizedBox(
                    height: 15.0,
                  ),
                  new OutlineButton(
                    borderSide: BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                        width: 3.0),
                    child: Text('Logout'),
                    onPressed: () {
                      // firebase.returnUid();
                      // FirebaseAuth.instance.signOut().then((action) {
                      //   Navigator.of(context)
                      //       .pushReplacementNamed('/landingpage');
                      // }).catchError((e) {
                      //   print(e);
                      // });
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/loginpage', (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
