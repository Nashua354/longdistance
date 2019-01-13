import 'package:flutter/material.dart';
import 'package:longdistance/model/user.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: RotatedBox(
          quarterTurns: 1,
          child: Hero(
            tag: 'settings',
            child: Icon(Icons.settings),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Name'),
              subtitle: Text('${userObject.name}'),
            ),
            ListTile(
              title: Text('Gender'),
              subtitle: Text('${userObject.gender}'),
            ),
            ListTile(
              title: Text('Age'),
              subtitle: Text('${userObject.age}'),
            ),
            ListTile(
              title: Text('Phone No'),
              subtitle: Text('${userObject.phoneNo}'),
            ),
            ListTile(
              title: Text('Partner'),
              subtitle: Text('${userObject.partnerName}'),
            ),
            ListTile(
              title: Text('Theme'),
              subtitle: Text('${userObject.theme}'),
            ),
            OutlineButton(
              borderSide: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 3.0),
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
            )
          ],
        ),
      ),
    );
  }
}
