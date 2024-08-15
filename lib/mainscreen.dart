import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Align(
          alignment: Alignment.center,
          child: TextButton(
            style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text(
              "Welcome to Flutter Sukker",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 50),
            ),
          )),
    );
  }
}
