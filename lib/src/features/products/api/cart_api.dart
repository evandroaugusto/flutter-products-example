import 'package:app_referencia/src/core/services/dio_client.dart';
import 'package:app_referencia/src/features/products/domain/entity/cart.dart';
import 'package:app_referencia/src/features/products/domain/repository/cart_repository.dart';
import 'package:dio/dio.dart';

class CartAPI implements CartRepository {
  late final Dio dio;

  CartAPI() {
    dio = DioClient().instance;
  }

  Future<List<Cart>> fetchCarts() async {
    Response response = await dio.get("https://fakestoreapi.com/carts");

    var carts = (response.data as List).map((item) {
      return Cart.fromJson(item);
    }).toList();

    return carts;
  }

  Future<Cart> fetchCart(int cartId) async {
    Response response = await dio.get("https://fakestoreapi.com/carts/$cartId");

    return Cart.fromJson(response.data);
  }
}
