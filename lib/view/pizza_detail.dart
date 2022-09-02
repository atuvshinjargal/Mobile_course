import 'package:flutter/material.dart';
import '../models/pizza.dart';
import '../httphelper.dart';

class PizzaDetail extends StatefulWidget {
  const PizzaDetail({Key? key}) : super(key: key);

  @override
  State<PizzaDetail> createState() => _PizzaDetailState();
}

class _PizzaDetailState extends State<PizzaDetail> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtname = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String postResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                postResult,
                style: TextStyle(
                  backgroundColor: Colors.green,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtId,
                decoration: InputDecoration(
                  hintText: 'ID оруулах',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  hintText: 'Pizza -ны нэр оруулах',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtDescription,
                decoration: InputDecoration(
                  hintText: 'Pizza -ны тайлбар оруулах',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtPrice,
                decoration: InputDecoration(
                  hintText: 'Pizza -ны үнэ оруулах',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtImageUrl,
                decoration: InputDecoration(
                  hintText: 'Pizza -ны зурагны хаяг оруулах',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  postPizza();
                },
                child: Text('Pizza хадгалах'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza(
      id: int.tryParse(txtId.text),
      pizzaName: txtname.text,
      description: txtDescription.text,
      price: double.tryParse(txtDescription.text),
      imageUrl: txtImageUrl.text,
    );
    String result = await helper.postPizza(pizza);
    setState(() {
      postResult = result;
    });
  }
}
