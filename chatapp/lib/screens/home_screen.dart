import 'package:chatapp/api/apis.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.home),
        title: const Text('Talky App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            await Apis.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),

      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.only(top: mq.height * .01),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const ChatUserCard();
        },
      ),
    );
  }
}
