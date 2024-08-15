import 'package:assign2/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:assign2/loginscreen.dart';
import 'package:assign2/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<SharedPreferences> getPreferences() async {
  return await SharedPreferences.getInstance();
}

void main() async {
  // Ensure that Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Check if user is logged in by retrieving a boolean value from SharedPreferences


  // Determine the initial route based on the login status
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',

      routes: {
        '/splash': (context) =>const Splash(),
        '/login': (context) => const Login(),
        '/homescreen': (context) => const Home(),
      },
    );
  }
}
