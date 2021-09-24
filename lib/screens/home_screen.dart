import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';

  HomeScreen({Key? key}) : super(key: key);

  final List<Product> loadedProduct = [
    Product(
        id: 'p1',
        title: 'A Black Shirt',
        description: 'Branded Shirt',
        price: 300.0,
        imageUrl: 'https://images.unsplash.com/'
            'photo-1583743814966-8936f5b7be1a?'
            'ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8'
            'c2hpcnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto='
            'format&fit=crop&w=600&q=60'),
    Product(
        id: 'p2',
        title: 'Tissot Watch',
        description: 'A Branded Tissot Watch',
        price: 800.0,
        imageUrl: 'https://images.unsplash.com/'
            'photo-1522312346375-d1a52e2b99b3'
            '?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx'
            '8d2F0Y2h8ZW58MHx8MHx8&ixlib=rb-1.2.1&'
            'auto=format&fit=crop&w=600&q=60'),
    Product(
        id: 'p3',
        title: 'Alicia Jeans',
        description: 'Cool Blue Jeans',
        price: 500.0,
        imageUrl: 'https://images.unsplash.com/'
            'photo-1541099649105-f69ad21f3246?'
            'ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfH'
            'x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto='
            'format&fit=crop&w=687&q=80'),
    Product(
        id: 'p4',
        title: 'StreetBond Shoes',
        description: 'Red Street Bond Shoes',
        price: 400.0,
        imageUrl: 'https://images.unsplash.com/'
            'photo-1560769629-975ec94e6a86?ixlib='
            'rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by'
            '1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProduct.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.25,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) => ProductItem(
            id: loadedProduct[index].id,
            title: loadedProduct[index].title,
            imageUrl: loadedProduct[index].imageUrl),
      ),
    );
  }
}
