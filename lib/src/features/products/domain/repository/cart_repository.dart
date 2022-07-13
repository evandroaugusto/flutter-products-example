import 'package:app_referencia/src/features/products/domain/entity/cart.dart';

abstract class CartRepository {
  Future<List<Cart>> fetchCarts();
  Future<Cart> fetchCart(int cartId);
}
