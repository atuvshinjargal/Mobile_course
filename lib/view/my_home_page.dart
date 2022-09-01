import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/pizza.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? appCounter;
  String pizzaString = '';
  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List myMap = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    myMap.forEach(
      (dynamic pizza) {
        Pizza myPizza = Pizza.fromJson(pizza);
        myPizzas.add(myPizza);
      },
    );
    // setState(() {
    //   pizzaString = myString;
    // });
    return myPizzas; //List<Pizza>
  }

  Future readAndWritePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter');
    if (appCounter == null) {
      appCounter = 1;
    } else {
      appCounter = appCounter! + 1;
    }
    await prefs.setInt('appCounter', appCounter!);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  @override
  void initState() {
    //readJsonFile();
    readAndWritePreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Та энэ апп -г ${appCounter} удаа нээсэн байна.'),
              ElevatedButton(
                onPressed: () {
                  deletePreferences();
                },
                child: Text('Тоолуурыг тэглэх'),
              ),
            ],
          ),
        ),
        // child: FutureBuilder(
        //   future: readJsonFile(),
        //   builder: ((BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
        //     return ListView.builder(
        //       itemCount: pizzas.data == null ? 0 : pizzas.data!.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return ListTile(
        //           title: Text(pizzas.data![index].pizzaName!),
        //           subtitle: Text(
        //               '${pizzas.data![index].description!} - ${pizzas.data![index].price!}'),
        //         );
        //       },
        //     );
        //   }),
        // ),
      ),
    );
  }
}
