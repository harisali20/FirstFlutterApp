import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget {

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final sp = await getPreferences();
    bool isLoggedIn = sp.getBool('isLoggedIn') ?? false;
    sp.remove('isLoggedIn');
    // Delay for splash effect
    await Future.delayed(Duration(seconds: 3));

    // Navigate based on the login status
    if (isLoggedIn) {
      print(sp.get('email'));
      print(sp.get('password'));
      Navigator.pushReplacementNamed(context, '/homescreen');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Welcome to Flutter Sukker",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
