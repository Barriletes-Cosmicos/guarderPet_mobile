import 'package:flutter/material.dart';
import 'package:guarderpet_mobile/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GuarderPet',
      home: LoginScreen(),
    );
  }
}
