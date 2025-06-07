import 'package:chatapp/main.dart';
import 'package:chatapp/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(microseconds: 1500), () {

      // nav to homescreen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const login_screen()));

      // exit to full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: const Text('Welcome to Talky App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .15,
            left: mq.width * .25,
            width: mq.width * .5,
            
            child: Image.asset('assets/chatlogo.png'),
          ),
          Positioned(
            bottom: mq.height * .15,
           
            width: mq.width ,
          
            child: Text('Made in India', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20 , 
              color: Colors.black,
              letterSpacing: .5)
            )
          )
        
        ],
      ),
    );
  }
}


