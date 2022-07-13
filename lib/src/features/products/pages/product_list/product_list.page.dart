import 'package:app_referencia/src/features/products/store/products.store.dart';
import 'package:app_referencia/src/features/products/widgets/product_card_widget.dart';
import 'package:app_referencia/src/shared/services/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProductsStore>(context, listen: false);

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
          future: Future.wait([store.fetchProducts(), store.fetchFavorites()]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer<ProductsStore>(
                builder: (context, store, child) {
                  return store.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ProductListPageView(store: store);
                },
              );
            }
          },
        ));
  }
}

class ProductListPageView extends StatelessWidget {
  final ProductsStore store;
  const ProductListPageView({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.products.length + 1,
      itemBuilder: (context, index) {
        return ProductCard(
          product: store.products[index],
          favorites: store.favoritedProducts,
          onFavorite: () {
            LoadingOverlay.of(context).show();
            store.addToFavorite(store.products[index]).then(
                  (value) => LoadingOverlay.of(context).hide(),
                );
          },
        );
      },
    );
  }
}
