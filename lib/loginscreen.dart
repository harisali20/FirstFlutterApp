import 'package:flutter/material.dart';
import 'package:assign2/main.dart';
import 'package:assign2/splash_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool registered = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_return_rounded),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Splash(),
                  ),
                );
              },
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(height: 100),
              Align(alignment: Alignment.bottomLeft, child: const Text("Email", style: TextStyle(fontSize: 20),)),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter email',
                  ),
                  controller: _emailController,
              ),
              SizedBox(height: 40),
              Align(alignment: Alignment.bottomLeft, child: const Text("Password",style: TextStyle(fontSize: 20),)),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Enter password',
                ),
                controller: _passwordController,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () async {
                      final sp = await getPreferences();
                      print(sp.get('email'));
                      print(sp.get('password'));
                      if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        );
                      }else{
                        sp.setString('email', _emailController.text);
                        sp.setString('password', _passwordController.text);
                        setState(() {
                          registered = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registered successfully'),

                          ),
                        );
                      }

                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () async {
                      final sp = await getPreferences();
                      print(sp.get('email'));
                      print(sp.get('password'));
                        if (sp.getString('email') == _emailController.text &&
                            sp.getString('password') == _passwordController.text) {
                          sp.setBool('isLoggedIn', true);
                          Navigator.pushReplacementNamed(context, '/homescreen');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Incorrect email or password'),
                            ),
                          );
                        }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
