import 'package:app_referencia/src/features/dashboard/pages/dashboard.page.dart';
import 'package:app_referencia/src/features/products/pages/product_detail/product_detail.page.dart';
import 'package:app_referencia/src/features/products/pages/product_list/product_list.page.dart';
import 'package:app_referencia/src/features/users/pages/user-detail/user_detail.page.dart';
import 'package:app_referencia/src/features/users/pages/user-list/user_list.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const dashboard = '/dshboard';
  static const products = '/products';
  static const productsDetail = '/proucts/detail';
  static const users = '/users/lists';
  static const userDetail = '/users/detail';

  Map<String, Widget Function(BuildContext)> get routes => {
        AppRoutes.dashboard: (ctx) => const DashboardPage(),
        AppRoutes.products: (ctx) => const ProductsListPage(),
        AppRoutes.productsDetail: (ctx) => const ProductsDetailPage(),
        AppRoutes.users: (ctx) => const UserListPage(),
        AppRoutes.userDetail: (ctx) => const UserDetaiPage()
      };
}
