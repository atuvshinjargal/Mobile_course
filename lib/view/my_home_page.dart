import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/pizza.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: Container(
        child: FutureBuilder(
          future: readJsonFile(),
          builder: ((BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(
              itemCount: pizzas.data == null ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(pizzas.data![index].pizzaName!),
                  subtitle: Text(
                      '${pizzas.data![index].description!} - ${pizzas.data![index].price!}'),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
