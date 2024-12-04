import 'package:flutter/material.dart';
import 'package:login_form/screens/login_page.dart';

class LoginProject extends StatelessWidget {
  const LoginProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        //'/registration': (context) => RegistraionPage(),
      },
    );
  }
}
