import '../domain/entity/product.dart';

class ProductState {
  bool isLoading;
  List<Product> products;
  List<Product> favoritedProducts;

  static get initialState => ProductState(
        isLoading: false,
        products: [],
        favoritedProducts: [],
      );

  ProductState({
    required this.isLoading,
    required this.products,
    required this.favoritedProducts,
  });
}
