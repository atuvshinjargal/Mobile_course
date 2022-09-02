import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/pizza.dart';

class HttpHelper {
  final String authority = 'wj229.mocklab.io';
  final String path = 'thing/8';
  final String postPath = 'pizza';
  final String putPath = 'pizza';
  final String deletePath = 'pizza';

  Future<List<Pizza>> getPizzaList() async {
    Uri url = Uri.https(authority, path); // https://wj229.mocklab.io/thing/8
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.OK) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);
    http.Response r = await http.post(url, body: post);
    return r.body;
  }

  Future<String> putPizza(Pizza pizza) async {
    String put = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, putPath);
    http.Response r = await http.put(
      url,
      body: put,
    );
    return r.body;
  }

  Future<String> deletePizza(int id) async {
    Uri url = Uri.https(authority, deletePath);
    http.Response r = await http.delete(url, body: id.toString());
    print(r.body);
    return r.body;
  }
}
