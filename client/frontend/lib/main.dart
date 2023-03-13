import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jada_helpifyr/screens/dashboard.dart';
import 'package:jada_helpifyr/screens/home.dart';
import 'package:jada_helpifyr/screens/register.dart';
import 'package:jada_helpifyr/screens/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAxsRAcJwF8shWMK3MG-bLUePfUTN20WyY',
          appId: 'com.example.jada_helpifyr',
          messagingSenderId: 'messagingSenderId',
          projectId: 'jadahelpifyr-3e716'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        SplashScreen.id:(context)=>SplashScreen(),
        HomeScreen.id:(context)=>const HomeScreen(),
        register.id:(context)=>const register(),
        dashboard.id:(context)=>const dashboard()
      },
    );
  }
}
