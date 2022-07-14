import 'package:app_referencia/src/features/products/domain/entity/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 240,
        child: CachedNetworkImage(
          imageUrl: product.image,
          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
