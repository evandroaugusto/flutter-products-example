import 'package:app_referencia/src/core/services/db_util.dart';
import 'package:app_referencia/src/core/services/dio_client.dart';
import 'package:app_referencia/src/features/products/domain/entity/product.dart';
import 'package:app_referencia/src/features/products/domain/repository/product_repository.dart';
import 'package:dio/dio.dart';

class ProductAPI implements ProductRepository {
  late final Dio dio = DioClient().instance;

  Future<List<Product>> fetchProducts() async {
    Response response = await dio.get("https://fakestoreapi.com/products");

    var products = (response.data as List).map((item) {
      return Product.fromJson(item);
    }).toList();

    return products;
  }

  Future<Product> fetchProduct(int productId) async {
    Response response =
        await dio.get("https://fakestoreapi.com/products/$productId");

    return Product.fromJson(response.data);
  }

  Future<void> addToFavorite(Product product) async {
    await DbUtil.insert(DbTables.favoritedProducts, {
      'id': product.id,
      'title': product.title,
      'description': product.description,
      'category': product.category,
      'image': product.image,
      'price': product.price
    });
  }

  Future<int> removeFavorite(Product product) async {
    return await DbUtil.deleteById(DbTables.favoritedProducts, product.id);
  }

  Future<List<Product>> fetchFavorites() async {
    final dataList = await DbUtil.getData(DbTables.favoritedProducts);

    final products = dataList
        .map((product) => Product(
            id: product["id"],
            title: product["title"],
            description: product["description"],
            category: product["category"],
            image: product["image"],
            price: product["price"]))
        .toList();

    return products;
  }
}
