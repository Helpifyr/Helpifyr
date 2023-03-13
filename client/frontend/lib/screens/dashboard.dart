import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class dashboard extends StatelessWidget {
  static String id = 'dashboard';

  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: TextButton(
          onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          },
          child: Text('Sign out')),
    );
  }
}
