import 'package:eshop/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  TextButton(
                    child: const Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.cartItems.values.toList(), cart.totalAmount);
                      cart.clear();
                      Navigator.pushNamed(context, OrderScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItemCount,
              itemBuilder: (context, index) => CartItemTile(
                id: cart.cartItems.values.toList()[index].id,
                title: cart.cartItems.values.toList()[index].title,
                price: cart.cartItems.values.toList()[index].price,
                quantity: cart.cartItems.values.toList()[index].quantity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
