import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String screenName;

  AppDrawer(this.screenName);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Image.asset(
              'assets/images/Logo.png',
              height: 60,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.black,
            height: 2.0,
          ),
          ListTile(
            title: Text('DashBoard'),
            onTap: () {
              if (screenName == 'Dashboard') {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/dashboard', (Route<dynamic> route) => false);
              }
            },
          ),
          Divider(
            color: Colors.black,
            height: 1.0,
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          Divider(
            color: Colors.black,
            height: 3.0,
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                title: OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
                  child: Text('Logout'),
                  onPressed: () {
                    print('logout');
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
