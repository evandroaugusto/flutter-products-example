import 'cart_product.dart';

class Cart {
  int id;
  int userId;
  String date;
  List<CartProduct> products = [];

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    this.products = const [],
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json["id"],
      userId: json["userId"],
      date: json["date"],
      products: cartProductsFromJson(json["products"]),
    );
  }
}
