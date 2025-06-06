import 'package:chatapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
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
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color.fromARGB(255, 46, 156, 50),
                shape: const StadiumBorder(),
                elevation: 1

              ),
              onPressed: () {},
              icon: Image.asset('assets/google .png', height: mq.height * .03),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    TextSpan(text: 'sign In with ' ),
                    TextSpan(
                      text: 'Google',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ]
                  

                )
              )
            ),
          ),
        ],
      ),
    );
  }
}
