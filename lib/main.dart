import 'package:flutter/material.dart';
import 'package:myapp/deep_tree.dart';
import 'package:myapp/e_commerce_screen.dart';
import 'package:myapp/flex_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/profile_screen.dart';

import 'stopwatch.dart';
//import 'basic_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static uurchlugduggui
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
