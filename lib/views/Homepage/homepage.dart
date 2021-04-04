import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            DatabaseReference dbref =
                FirebaseDatabase.instance.reference().child("Test");
            dbref.set("IsConnected");
          },
          child: Text("Press Me"),
        ),
      ),
    );
  }
}
