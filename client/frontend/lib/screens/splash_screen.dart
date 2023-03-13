import 'package:flutter/material.dart';
import 'package:jada_helpifyr/screens/home.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash';

  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate a long-running task
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.fill,
      ),
    ));
  }
}
