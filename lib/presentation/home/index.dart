import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/presentation/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("HOME"), Button("Sign out", onPressed: () => FirebaseAuth.instance.signOut())],
      ),
    );
  }
}
