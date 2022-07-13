import 'package:app_referencia/src/features/products/domain/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
  Future<Product> fetchProduct(int productId);
  Future<void> addToFavorite(Product product);
  Future<List<Product>> fetchFavorites();
  Future<int> removeFavorite(Product product);
}
