import 'package:app_referencia/src/app.routes.dart';
import 'package:app_referencia/src/features/products/api/product_api.dart';
import 'package:app_referencia/src/features/products/domain/repository/product_repository.dart';
import 'package:app_referencia/src/features/products/pages/product_list/product_list.page.dart';
import 'package:app_referencia/src/features/products/store/products.store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ProductRepository createProductRepository() => ProductAPI();

class AppReferencia extends StatelessWidget {
  const AppReferencia({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsStore(
            repository: createProductRepository(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'App Referencia',
        routes: AppRoutes().routes,
        home: const ProductsListPage(),
      ),
    );
  }
}
