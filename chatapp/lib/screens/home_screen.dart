import 'package:chatapp/api/apis.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/screens/auth/login_screen.dart';
import 'package:chatapp/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chatapp/model/ChatUser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
<<<<<<< HEAD

  // final List<ChatUser> list = [];

=======
  List<ChatUser> list = [];
>>>>>>> 9be1cee0796a57f3a7bf41d5bfee822b7e192a38

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('Talky App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () async {
              await Apis.auth.signOut();
              await GoogleSignIn().signOut();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const login_screen()),
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),

      // FAB remains for comment/add
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            // You can implement add comment action here
          },
          child: const Icon(Icons.add_comment_rounded),
          tooltip: 'Add Comment',
        ),
      ),

      // body
      body: StreamBuilder(
        stream: Apis.firestore.collection('ChatUser').snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data!.docs;
              list = data.map((e) => ChatUser.fromJson(e.data())).toList();

              if (list.isNotEmpty) {
                return ListView.builder(
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: mq.height * .01),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChatUserCard(user: list[index]);
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'NO CONNECTION FOUND!',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
