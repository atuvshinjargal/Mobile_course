import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({Key? key}) : super(key: key);

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color? color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Өнгө өөрчлөх'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    color = null;
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Маш чухал асуулт'),
            content: Text('Та аль нэг өнгийг сонгоно уу.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  color = Colors.red;
                  Navigator.pop(context, color);
                },
                child: Text('Улаан'),
              ),
              TextButton(
                onPressed: () {
                  color = Colors.green;
                  Navigator.pop(context, color);
                },
                child: Text('Ногоон'),
              ),
              TextButton(
                onPressed: () {
                  color = Colors.blue;
                  Navigator.pop(context, color);
                },
                child: Text('Цэнхэр'),
              ),
            ],
          );
        });
    setState(() {
      color = color;
    });
  }
}
