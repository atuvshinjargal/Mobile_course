import 'package:flutter/material.dart';
import 'package:myapp/deep_tree.dart';
import 'package:myapp/e_commerce_screen.dart';
import 'package:myapp/flex_screen.dart';
import 'package:myapp/login_screen.dart';
import 'package:myapp/profile_screen.dart';
import 'package:myapp/view/plan_screen.dart';

import 'plan_provider.dart';
import 'stopwatch.dart';
import 'view/plan_creator_screen.dart';
//import 'basic_screen.dart';

void main() {
  runApp(PlanProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  //static uurchlugduggui
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanCreatorScreen(),
/*       routes: {
        '/': (context) => const LoginScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        StopWatch.route: (context) => const StopWatch(),
      },
      initialRoute: '/', */
    );
  }
}
