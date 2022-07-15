import 'package:dio/dio.dart';

import '../../../../core/services/db_util.dart';
import '../../../../core/services/dio_client.dart';
import '../../domain/entity/product.dart';

class HttpProductRepository {
  late final dio = DioClient().instance;

  Future<List<Product>> fetchProducts() async {
    Response response = await dio.get("/products");

    var products = (response.data as List).map((item) {
      return Product.fromMap(item);
    }).toList();

    return products;
  }

  Future<Product> fetchProduct(int productId) async {
    Response response = await dio.get("/products/$productId");

    return Product.fromMap(response.data);
  }
}
