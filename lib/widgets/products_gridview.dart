import 'package:eshop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductsGridView extends StatelessWidget {
  final bool showFavOnly;
  const ProductsGridView({
    Key? key,
    required this.showFavOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products =
        showFavOnly ? productData.showFavProductsOnly : productData.products;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.25,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        //use this when using existing value like products[index]
        value: products[index],
        // create: (ctx) => products[index],
        child: const ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl,
            ),
      ),
    );
  }
}
