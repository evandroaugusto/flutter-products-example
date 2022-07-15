import 'package:flutter/material.dart';

import '../domain/entity/product.dart';
import '../repositories/database/db_product_repository.dart';
import '../repositories/http/http_product_repository.dart';
import 'products.state.dart';

class ProductsStore extends ChangeNotifier {
  final ProductState _state = ProductState.initialState;

  final HttpProductRepository httpRepository;
  final DbProductRepository dbRepository;

  ProductsStore({
    required this.httpRepository,
    required this.dbRepository,
  });

  // store properties
  bool get isLoading => _state.isLoading;
  List<Product> get products => _state.products;
  List<Product> get favoritedProducts => _state.favoritedProducts;

  // methods
  Future<List<Product>> fetchProducts() async {
    _state.products = await httpRepository.fetchProducts();
    _state.isLoading = false;
    notifyListeners();

    return _state.products;
  }

  Future<void> toggleFavorite(Product product) async {
    findProductIndex() => _state.favoritedProducts
        .indexWhere((element) => element.id == product.id);

    isProductFavorited() => findProductIndex() > -1;

    if (isProductFavorited()) {
      await removeFavorite(product);
      notifyListeners();
      return;
    }

    await addToFavorite(product);
  }

  Future<void> addToFavorite(Product product) async {
    await dbRepository.addToFavorite(product);
    await Future.delayed(const Duration(milliseconds: 500));
    _state.favoritedProducts.add(product);

    notifyListeners();
  }

  Future<void> removeFavorite(Product product) async {
    await dbRepository.removeFavorite(product);
    await Future.delayed(const Duration(milliseconds: 500));

    removeFromMemory() => _state.favoritedProducts
        .removeWhere((element) => element.id == product.id);

    removeFromMemory();
    notifyListeners();
  }

  Future<List<Product>> fetchFavorites() async {
    _state.favoritedProducts = await dbRepository.fetchFavorites();

    notifyListeners();
    return _state.favoritedProducts;
  }
}
