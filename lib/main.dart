import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'GoogleService/SignInScreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize a new Firebase App instance
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: SignInScreen(),
    );
  }
}
