import 'package:app_referencia/src/features/products/pages/product_detail/product_detail.facade.dart';
import 'package:app_referencia/src/features/products/store/products.store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/favorite_button.widget.dart';
import 'widgets/product_image.widget.dart';

class ProductsDetailPage extends StatefulWidget {
  const ProductsDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalhe produto")),
      body: ChangeNotifierProvider<ProductDetailFacade>(
        create: (_) => ProductDetailFacade(),
        builder: (context, child) {
          final facade = context.read<ProductDetailFacade>();

          return FutureBuilder(
              future: facade.fetchProduct(productId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const _ProductDetailPageView();
                }
              });
        },
      ),
    );
  }
}

class _ProductDetailPageView extends StatelessWidget {
  const _ProductDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailFacade>().product;

    final productsStore = context.read<ProductsStore>();
    product!.setFavorites(productsStore.favoritedProducts);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          ProductImage(product: product),
          const SizedBox(height: 30),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product.category,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 15),
          Text(product.description),
          const SizedBox(height: 15),
          const FavoriteButton()
        ],
      ),
    );
  }
}
