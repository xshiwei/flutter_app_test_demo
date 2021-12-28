import 'package:flutter/material.dart';
import 'package:flutter_app_test_demo/provider/cart/models/catalog.dart';

class CartModel with ChangeNotifier {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

  void refresh(){
    notifyListeners();
  }
}
