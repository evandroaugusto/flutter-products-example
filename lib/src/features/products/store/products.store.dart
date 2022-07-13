import 'package:app_referencia/src/features/products/domain/entity/product.dart';
import 'package:app_referencia/src/features/products/domain/repository/product_repository.dart';
import 'package:flutter/material.dart';

class _ProductState {
  bool isLoading = true;
  List<Product> products = [];
  List<Product> favoritedProducts = [];
}

class ProductsStore extends ChangeNotifier {
  final _ProductState _state = _ProductState();
  final ProductRepository repository;

  ProductsStore({required this.repository});

  // getters
  bool get isLoading => _state.isLoading;
  List<Product> get products => _state.products;
  List<Product> get favoritedProducts => _state.favoritedProducts;

  // methods
  Future<List<Product>> fetchProducts() async {
    _state.products = await repository.fetchProducts();
    _state.isLoading = false;
    notifyListeners();

    return _state.products;
  }

  Future<void> addToFavorite(Product product) async {
    try {
      var index = _state.favoritedProducts
          .indexWhere((element) => element.id == product.id);

      if (index > -1) {
        await removeFavorite(product);
        notifyListeners();
        return;
      }

      // add to favorite
      await repository.addToFavorite(product);
      await Future.delayed(const Duration(milliseconds: 500));
      _state.favoritedProducts.add(product);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeFavorite(Product product) async {
    await repository.removeFavorite(product);
    await Future.delayed(const Duration(milliseconds: 500));

    _state.favoritedProducts.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }

  Future<List<Product>> fetchFavorites() async {
    _state.favoritedProducts = await repository.fetchFavorites();

    notifyListeners();
    return _state.favoritedProducts;
  }
}
