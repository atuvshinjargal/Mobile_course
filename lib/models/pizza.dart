class Pizza {
  int? id;
  String? pizzaName;
  String? description;
  double? price;
  String? imageUrl;

  Pizza.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.pizzaName = json['pizzaName'];
    this.description = json['description'];
    this.price = json['price'];
    this.imageUrl = json['imageUrl'];
  }
}
