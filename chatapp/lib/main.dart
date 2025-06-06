import 'package:chatapp/screens/auth/login_screen.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talky App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
          backgroundColor: const Color.fromARGB(255, 193, 193, 224),
        ),
      ),
      home: const login_screen(),
    );
  }
}
