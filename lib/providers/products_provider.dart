import 'package:flutter/material.dart';
import 'product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
        id: 'p1',
        title: 'A Black Shirt',
        description: 'The unnamed constructor on '
            'List creates a new list with the given'
            ' size but does not initialize any of the elements.',
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

  List<Product> get products {
    return [..._products];
  }

  List<Product> get showFavProductsOnly {
    return _products.where((prod) => prod.isFavourite).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _products.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product product) {
    final prodIndex = products.indexWhere((prod) => prod.id == id);
    _products[prodIndex] = product;
    notifyListeners();
  }

  void removeProduct(String id) {
    final prodIndex = products.indexWhere((prod) => prod.id == id);
    _products.removeAt(prodIndex);
    notifyListeners();
  }
}
