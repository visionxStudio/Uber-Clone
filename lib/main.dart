import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:uberclone/screens/homepage.dart';
import 'package:uberclone/screens/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: const FirebaseOptions(
      appId: '1:1051837497235:android:b6241540d6ebe3607fb266',
      apiKey: 'AIzaSyD1gjV8KbHxbwNVFMSVA81bhCyEuWf1ics',
      messagingSenderId: '297855924061',
      projectId: 'flutter-firebase-plugins',
      databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      theme: ThemeData(
        fontFamily: 'Brand-Regular',
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}
