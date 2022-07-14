import 'dart:convert';

List<Product> productsFromJson(String str) {
  final products = json.decode(str).map((x) => Product.fromMap(x));
  return List<Product>.from(products);
}

class Product {
  int id;
  String title;
  num price;
  String category;
  String description;
  String image;
  List<Product> _favorites = [];

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  bool isFavorite() {
    var hasIndex = _favorites.indexWhere((element) => element.id == id);
    return hasIndex > -1;
  }

  setFavorites(List<Product> products) {
    _favorites = products;
  }

  // Mapper
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      category: json["category"],
      description: json["description"],
      image: json["image"],
    );
  }

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "category": category,
      "description": description,
      "image": image
    };
  }
}
