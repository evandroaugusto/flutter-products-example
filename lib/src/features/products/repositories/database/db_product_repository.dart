import '../../../../core/services/db_util.dart';
import '../../domain/entity/product.dart';

class DbProductRepository {
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
