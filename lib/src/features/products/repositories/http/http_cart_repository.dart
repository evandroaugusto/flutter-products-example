import 'package:dio/dio.dart';

import '../../../../core/http/dio_client.dart';
import '../../domain/entity/cart.dart';

class HttpCartRepository {
  late final dio = DioClient().instance;

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
