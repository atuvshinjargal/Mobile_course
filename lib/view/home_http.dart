import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../httphelper.dart';
import '../models/pizza.dart';
import './pizza_detail.dart';

class HomeHttp extends StatefulWidget {
  const HomeHttp({Key? key}) : super(key: key);

  @override
  State<HomeHttp> createState() => _HomeHttpState();
}

class _HomeHttpState extends State<HomeHttp> {
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  @override
  void initState() {
    callPizzas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP JSON'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetail(
                isNew: true,
              ),
            ),
          );
        },
      ),
      body: Container(
        child: FutureBuilder(
          future: callPizzas(),
          builder: (context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(
              itemCount: pizzas.data == null ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (item) {
                    HttpHelper helper = HttpHelper();
                    pizzas.data!
                        .removeWhere((element) => element.id == item.index);
                    helper.deletePizza(pizzas.data![index].id!);
                  },
                  key: Key(index.toString()),
                  child: ListTile(
                    title: Text(pizzas.data![index].pizzaName!),
                    subtitle: Text(
                        '${pizzas.data![index].description!} ${pizzas.data![index].price!.toString()}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PizzaDetail(
                              pizza: pizzas.data![index], isNew: false),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
