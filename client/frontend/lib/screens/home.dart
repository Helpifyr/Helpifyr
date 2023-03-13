import 'package:flutter/material.dart';
import 'package:jada_helpifyr/common/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jada_helpifyr/screens/dashboard.dart';
import 'package:jada_helpifyr/screens/register.dart';
import 'package:loading_overlay/loading_overlay.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
String email = '';
String pass = '';

class HomeScreen extends StatefulWidget {
  static String id= ' login';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: show,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/logo.png'),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.cyanAccent, fontSize: 12),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.cyanAccent, fontSize: 12),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                pass = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all( Radius.circular(32.0)),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all( Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all( Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, register.id);
                },
                child: const Text('Not have an account'),
              ),
            ),
            bt1(
                color: Colors.black38,
                txt: 'Login',
                func: () async {
                  setState(() {
                    show = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: pass);
                    if (user != null) {
                      await Navigator.pushNamed(context, dashboard.id);
                    }
                    setState(() {
                      show = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    show = false;
                  });
                })
          ],
        ),
      ),
    );
  }
}
