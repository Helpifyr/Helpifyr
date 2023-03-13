import 'package:flutter/material.dart';
class bt1 extends StatelessWidget {
  bt1({required this.color, required this.txt, required this.func});

  final Color color;
  final String txt;
  final func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: func,
          //Go to login screen.
          // Navigator.pushNamed(context, LoginScreen.id);
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            txt,
          ),
        ),
      ),
    );
  }
}