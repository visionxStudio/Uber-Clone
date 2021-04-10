import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/views/Homepage/homepage.dart';
import 'package:uberclone/views/Login/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   name: 'db2',
  //   options: const FirebaseOptions(
  //     appId: '1:1051837497235:android:b6241540d6ebe3607fb266',
  //     apiKey: 'AIzaSyD1gjV8KbHxbwNVFMSVA81bhCyEuWf1ics',
  //     messagingSenderId: '297855924061',
  //     projectId: 'flutter-firebase-plugins',
  //     databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
  //   ),
  // );
  // runApp(MyApp());
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
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
      getPages: [
        GetPage(
          name: "homepage",
          page: () => Homepage(),
        ),
        GetPage(
          name: "Login",
          page: () => LoginPage(),
        ),
      ],
    );
  }
}
