import 'package:flutter/gestures.dart';

class Pizza {
  int? id;
  String? pizzaName;
  String? description;
  double? price;
  String? imageUrl;

  Pizza({this.id, this.pizzaName, this.description, this.price, this.imageUrl});

  Pizza.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.pizzaName = json['pizzaName'];
    this.description = json['description'];
    this.price = json['price'];
    this.imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['id'] = this.id;
    json['pizzaName'] = this.pizzaName;
    json['description'] = this.description;
    json['price'] = this.price;
    json['imageUrl'] = this.imageUrl;

    return json;
  }
}
