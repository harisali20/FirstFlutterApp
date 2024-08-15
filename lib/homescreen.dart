import 'package:flutter/material.dart';
import 'package:assign2/main.dart';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final prefs = await getPreferences();
    setState(() {
      _email = prefs.getString('email') ?? 'No email found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text("Home Page"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            );
          },
        ),
      ),
      body: Center(
        child: Text("Welcome $_email",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
