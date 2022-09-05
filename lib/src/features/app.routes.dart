import 'package:app_referencia/src/features/dashboard/pages/dashboard.page.dart';
import 'package:app_referencia/src/features/users/users.routes.dart';
import 'package:flutter/material.dart';

import 'products/products.routes.dart';

class AppRoutes {
  static const dashboard = 'dashboard';
  static const logout = '/logout';

  Map<String, Widget Function(BuildContext)> get routes => {
        AppRoutes.dashboard: (ctx) => const DashboardPage(),
        ...ProductsRoutes().routes,
        ...UserRoutes().routes
      };
}
