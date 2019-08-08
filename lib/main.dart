import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'signup.dart';
import 'loginpage.dart';
import 'Homepage.dart';
import 'reader.dart';
import 'reader2.dart';
import 'reader3.dart';
import 'result.dart';
import 'assign.dart';
import 'password.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'Firstpage',
      routes: {
        'Fisrtpage':(context)=>Firstpage(),
        'Assign':(context)=>Assign(),
        'Result':(context)=>Result(),
        'Reader':(context)=>Reader(),
        'pass':(context)=>pass(),
        'Reader2':(context)=>Reader2(),
        'Reader3':(context)=>Reader3(),
        'SignUppage':(context)=>SignupPage(),
        'LoginPage':(context)=>LoginPage(),
        'homepage':(context)=>homepage()
      },
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Firstpage(),
    );
  }
}

