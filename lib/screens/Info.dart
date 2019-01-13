import 'package:flutter/material.dart';
import 'package:longdistance/model/user.dart';

class Info extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Info'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            ListTile(
                title: TextFormField(
              onSaved: (value) => userObject.name = value,
            )),
          ],
        ),
      ),
    );
  }
}
