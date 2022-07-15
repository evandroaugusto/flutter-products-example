import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../domain/entity/product.dart';
import '../products.routes.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final List<Product>? favorites;
  final Function? onFavorite;

  const ProductCard(
      {Key? key, required this.product, this.onFavorite, this.favorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    product.setFavorites(favorites ?? []);

    void _navigateToProductDetail(int productId) {
      Navigator.of(context).pushNamed(
        ProductsRoutes.productsDetail,
        arguments: productId,
      );
    }

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _CardHeader(product: product),
          SizedBox(
            height: 140,
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          _CardButton(
            title: 'VER PRODUTO',
            onClick: () => _navigateToProductDetail(product.id),
          ),
          const SizedBox(
            height: 10,
          ),
          _CardButton(
            title: product.isFavorite() ? 'DESFAVORITAR' : 'FAVORITAR',
            color: product.isFavorite() ? Colors.red : Colors.green,
            onClick: () => onFavorite?.call(),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  final String title;
  final Function onClick;
  final MaterialColor? color;

  const _CardButton(
      {Key? key, required this.title, required this.onClick, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 25),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(product.title),
          subtitle: Text(
            product.category,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}
