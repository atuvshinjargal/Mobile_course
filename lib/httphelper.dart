import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/pizza.dart';

class HttpHelper {
  final String authority = 'wj229.mocklab.io';
  final String path = 'thing/8';

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
}
