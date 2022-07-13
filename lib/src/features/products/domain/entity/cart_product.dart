import 'dart:convert';

List<CartProduct> cartProductsFromJson(String str) {
  final cartProducts = json.decode(str).map((x) => CartProduct.fromJson(x));
  return List<CartProduct>.from(cartProducts);
}

class CartProduct {
  int productId;
  int quantity;

  CartProduct({
    required this.productId,
    required this.quantity,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json["productId"],
      quantity: json["quantity"],
    );
  }
}
