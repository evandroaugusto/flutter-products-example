import 'package:app_referencia/src/features/products/repositories/http/http_product_repository.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/product.dart';

class ProductState {
  bool isLoading = true;
  Product? product;
}

class ProductDetailFacade extends ChangeNotifier {
  final ProductState _state = ProductState();
  final HttpProductRepository _repository = HttpProductRepository();

  // getters
  bool get isLoading => _state.isLoading;
  Product? get product => _state.product;

  // methods
  Future<Product?> fetchProduct(int productId) async {
    _state.product = await _repository.fetchProduct(productId);
    _state.isLoading = false;
    notifyListeners();

    return _state.product;
  }
}
