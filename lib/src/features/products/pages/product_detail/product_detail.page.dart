import 'package:app_referencia/src/features/products/domain/entity/product.dart';
import 'package:app_referencia/src/features/products/pages/product_detail/product_detail.facade.dart';
import 'package:app_referencia/src/features/products/store/products.store.dart';
import 'package:app_referencia/src/shared/services/loading_overlay.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          final facade =
              Provider.of<ProductDetailFacade>(context, listen: false);

          return FutureBuilder(
              future: facade.fetchProduct(productId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Consumer<ProductDetailFacade>(
                    builder: (context, facade, child) {
                      return facade.isLoading
                          ? const Expanded(
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : _ProductDetailPageView(product: facade.product);
                    },
                  );
                }
              });
        },
      ),
    );
  }
}

class _ProductDetailPageView extends StatelessWidget {
  final Product? product;

  const _ProductDetailPageView({Key? key, required this.product})
      : super(key: key);

  Widget _favoriteButton({
    required String title,
    MaterialColor? color,
    required Function onClick,
  }) {
    return SizedBox(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color ?? Colors.blue),
          onPressed: () {
            onClick();
          },
          child: Text(title),
        ),
      ),
    );
  }

  Widget _productImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 240,
        child: CachedNetworkImage(
          imageUrl: product!.image,
          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var productsStore = Provider.of<ProductsStore>(context, listen: true);
    product!.setFavorites(productsStore.favoritedProducts);

    return product == null
        ? const Center(
            child: Text('Este produto não está mais disponível'),
          )
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                _productImage(),
                const SizedBox(height: 30),
                Text(
                  product!.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product!.category,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 15),
                Text(product!.description),
                const SizedBox(height: 15),
                _favoriteButton(
                  title: product!.isFavorite() ? 'DESFAVORITAR' : 'FAVORITAR',
                  color: product!.isFavorite() ? Colors.red : Colors.green,
                  onClick: () {
                    LoadingOverlay.of(context).show();
                    productsStore.addToFavorite(product!).then(
                          (value) => LoadingOverlay.of(context).hide(),
                        );
                  },
                ),
              ],
            ),
          );
  }
}
