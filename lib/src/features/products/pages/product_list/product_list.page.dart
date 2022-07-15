import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/services/loading_overlay.dart';
import '../../domain/entity/product.dart';
import '../../store/products.store.dart';
import '../../widgets/product_card_widget.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  Widget build(BuildContext context) {
    final store = context.read<ProductsStore>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
          actions: [
            Consumer<ProductsStore>(builder: (context, store, child) {
              return Center(child: Text("${store.favoritedProducts.length}"));
            }),
            const SizedBox(
              width: 4,
            ),
            const Icon(Icons.favorite_border_outlined),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: FutureBuilder(
          future: Future.wait(
            [
              store.fetchProducts(),
              store.fetchFavorites(),
            ],
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const _ProductListPageView();
            }
          },
        ));
  }
}

class _ProductListPageView extends StatelessWidget {
  const _ProductListPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ProductsStore>();

    _onAddToFavorite(Product product) {
      LoadingOverlay.of(context).show();
      store.toggleFavorite(product).then(
            (value) => LoadingOverlay.of(context).hide(),
          );
    }

    return ListView.builder(
      itemCount: store.products.length + 1,
      itemBuilder: (context, index) {
        return ProductCard(
          product: store.products[index],
          favorites: store.favoritedProducts,
          onFavorite: () => _onAddToFavorite(store.products[index]),
        );
      },
    );
  }
}
