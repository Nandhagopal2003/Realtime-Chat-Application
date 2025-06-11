import 'package:chatapp/api/apis.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Gmailscreen extends StatefulWidget {
  const Gmailscreen({super.key});

  @override
  State<Gmailscreen> createState() => _GmailscreenState();
}

class _GmailscreenState extends State<Gmailscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final userCredential = await Apis.auth
                      .createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                  // Get user UID
                  final uid = userCredential.user?.uid;

                  // Store email in Firestore (users collection)
                  await Apis.firestore.collection('users').doc(uid).set({
                    'email': emailController.text.trim(),
                    'createdAt': DateTime.now().toIso8601String(),
                  });

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  String message = "Sign Up failed";
                  if (e.code == 'email-already-in-use') {
                    message = "This email is already in use.";
                  }

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                }
              },

              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
