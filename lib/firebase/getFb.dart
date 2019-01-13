import 'package:firebase_auth/firebase_auth.dart';
import 'package:longdistance/model/user.dart';

class GetFb {
  String uid;
  returnUid() {
    FirebaseAuth.instance.currentUser().then((val) {
      uid = val.uid;
      userObject.uid = val.uid;
    });
  }
}
