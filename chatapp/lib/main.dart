import 'package:chatapp/screens/splash_screen.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Enable full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Set orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Firebase BEFORE runApp
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Run the app after Firebase is ready
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
      home: const SplashScreen(),
    );
  }
}
