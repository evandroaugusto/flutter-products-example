import 'package:app_referencia/src/features/products/pages/product_detail/product_detail.page.dart';
import 'package:app_referencia/src/features/products/pages/product_list/product_list.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const products = '/products';
  static const productsDetail = '/proucts/detail';

  Map<String, Widget Function(BuildContext)> get routes => {
        AppRoutes.products: (ctx) => const ProductsListPage(),
        AppRoutes.productsDetail: (ctx) => const ProductsDetailPage()
      };
}
