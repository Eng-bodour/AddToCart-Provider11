import 'package:flutter/cupertino.dart';
import 'item.dart';

class Cart with ChangeNotifier {
  final List<Item> _items = [];
  late double _price = 0.0;

  void add(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }

  int get count => _items.length;

  double totalPrice() => _price;
}
