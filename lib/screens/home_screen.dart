import 'package:eshop/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';
import '../widgets/products_gridview.dart';
import '../widgets/badge.dart';

enum Filter {
  favourites,
  all,
}

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Shop'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
              value: cart.cartItemCount.toString(),
            ),
          ),
          PopupMenuButton(
            onSelected: (selectedItem) {
              setState(() {
                if (selectedItem == Filter.favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: Filter.favourites,
                child: Text('Favourites'),
              ),
              const PopupMenuItem(
                value: Filter.all,
                child: Text('All'),
              ),
            ],
          ),
        ],
      ),
      body: ProductsGridView(showFavOnly: _showOnlyFavourites),
    );
  }
}
