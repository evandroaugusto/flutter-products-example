import 'package:app_referencia/src/features/products/api/product_api.dart';
import 'package:app_referencia/src/features/products/domain/entity/product.dart';

import 'package:app_referencia/src/features/products/domain/repository/product_repository.dart';
import 'package:flutter/material.dart';

class _ProductState {
  bool isLoading = true;
  Product? product;
}

class ProductDetailFacade extends ChangeNotifier {
  final _ProductState _state = _ProductState();
  final ProductRepository _repository = ProductAPI();

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
