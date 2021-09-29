import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemTile extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  const CartItemTile({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        padding: const EdgeInsets.only(left: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
        alignment: Alignment.centerLeft,
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeCartItem(id);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to remove the item?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.menu,
                size: 20.0,
                color: Colors.grey,
              ),
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FittedBox(
                        child: Text('\$$price'),
                      ),
                    ),
                  ),
                  title: Text(title),
                  subtitle: Text('\$${(price * quantity)}'),
                  trailing: Text('$quantity x'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
