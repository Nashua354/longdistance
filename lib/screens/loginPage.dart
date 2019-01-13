import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longdistance/model/user.dart';
import 'package:longdistance/screens/dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String phoneNo;
  String smsCode;
  String verificationId;

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      //smsCodeDialog(context).then((value) {
      print('Signed in');
      //});
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      print('verified');
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('Done'),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
    FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((user) {
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e) {
      print(e);
    });
  }

  bool verifyCheck = false;
  GlobalKey<FormState> formKeyNumber = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyOtp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('PhoneAuth'),
      // ),
      body: new Center(
        child: Container(
            padding: EdgeInsets.all(25.0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: SizedBox(
                    height: queryData.size.height / 3,
                    child: Hero(
                      tag: 'logoHero',
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                  ),
                ),
                Form(
                  key: formKeyNumber,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Phone number',
                        ),
                        onSaved: (value) {
                          userObject.phoneNo = value;
                        },
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Enter a Number';
                          else
                            return null;
                        },
                        autofocus: false,
                      ),
                      SizedBox(height: 10.0),
                      RaisedButton(
                          child: Text('Verify'),
                          // textColor: Colors.white,
                          elevation: 7.0,
                          // color: Colors.blue,
                          onPressed: () {
                            // verifyPhone();
                            setState(() {
                              verifyCheck = !verifyCheck;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                  key: formKeyOtp,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'Enter OTP'),
                          enabled: verifyCheck,
                          onChanged: (value) {
                            smsCode = value;
                          },
                        ),
                      ),
                      RaisedButton(
                        child: Text('Submit'),
                        // textColor: Colors.white,
                        elevation: 7.0,
                        // color: Colors.blue,
                        onPressed: !verifyCheck
                            ? null
                            : () {
                                // Navigator.of(context).push( '/homepage');
                                // FirebaseAuth.instance.currentUser().then((user) {
                                //   if (user != null) {
                                //     Navigator.of(context)
                                //         .pushReplacementNamed('/homepage');
                                //   } else {
                                //     Navigator.of(context).pop();
                                //     signIn();
                                //   }
                                // });
                                Navigator.of(context).pushNamed('/dashboard');
                              },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
