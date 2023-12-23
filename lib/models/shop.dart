import 'package:flutter/cupertino.dart';
import 'package:locla_memo_try/models/product.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop=[
    //product 1
    Product(title: 'product 1', id: '1', imageUrl: 'imageUrl1'),
    Product(title: 'product 2', id: '2', imageUrl: 'imageUrl2'),
    Product(title: 'product 3', id: '3', imageUrl: 'imageUrl3'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
    Product(title: 'product 4', id: '4', imageUrl: 'imageUrl4'),
  ];
  List<Product> _cart=[];
  List<Product> get shop=>_shop;
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}