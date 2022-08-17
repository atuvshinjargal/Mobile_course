import 'package:flutter/material.dart';
import 'package:myapp/my_first_widget.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Tsahim Erdenet TBB'),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: const Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: MyFirstWidget(),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: const Center(child: Text('Ene bol Drawer!')),
        ),
      ),
    );
  }
}
