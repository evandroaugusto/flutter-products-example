import 'package:app_referencia/src/features/products/pages/product_detail/product_detail.facade.dart';
import 'package:app_referencia/src/features/products/store/products.store.dart';
import 'package:app_referencia/src/shared/services/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsStore = context.watch<ProductsStore>();
    final product = context.read<ProductDetailFacade>().product;

    _onFavorite() {
      LoadingOverlay.of(context).show();

      productsStore.addToFavorite(product!).then(
            (value) => LoadingOverlay.of(context).hide(),
          );
    }

    getButtonColor() => product!.isFavorite() ? Colors.red : Colors.green;
    getButtonTitle() => product!.isFavorite() ? 'DESFAVORITAR' : 'FAVORITAR';

    return SizedBox(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: getButtonColor(),
          ),
          onPressed: _onFavorite,
          child: Text(getButtonTitle()),
        ),
      ),
    );
  }
}
