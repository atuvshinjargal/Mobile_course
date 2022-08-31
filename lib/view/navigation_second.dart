import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({Key? key}) : super(key: key);

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.orange;
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation second screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                color = Colors.red;
                Navigator.pop(context, color);
              },
              child: Text('Улаан'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Colors.green;
                Navigator.pop(context, color);
              },
              child: Text('Ногоон'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Colors.blue;
                Navigator.pop(context, color);
              },
              child: Text('Цэнхэр'),
            ),
          ],
        ),
      ),
    );
  }
}
