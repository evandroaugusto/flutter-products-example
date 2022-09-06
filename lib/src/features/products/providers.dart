import 'package:app_referencia/src/features/products/store/products.store.dart';
import 'package:provider/provider.dart';

import 'repositories/database/db_product_repository.dart';
import 'repositories/http/http_product_repository.dart';

var productsStoreProvider = ChangeNotifierProvider(
  create: (_) => ProductsStore(
    httpRepository: HttpProductRepository(),
    dbRepository: DbProductRepository(),
  ),
);
