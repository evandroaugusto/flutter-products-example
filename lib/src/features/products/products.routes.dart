import 'package:flutter/material.dart';

import 'pages/product_detail/product_detail.page.dart';
import 'pages/product_list/product_list.page.dart';

class ProductsRoutes {
  static const products = '/products';
  static const productsDetail = '/products/detail';

  Map<String, Widget Function(BuildContext)> get routes => {
        ProductsRoutes.products: (ctx) => const ProductsListPage(),
        ProductsRoutes.productsDetail: (ctx) => const ProductsDetailPage(),
      };
}
