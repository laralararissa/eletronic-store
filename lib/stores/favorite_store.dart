import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class FavoriteStore extends ValueNotifier<List<Product>> {
  static final FavoriteStore _instance = FavoriteStore._internal();

  factory FavoriteStore() {
    return _instance;
  }

  FavoriteStore._internal() : super([]);

  static FavoriteStore get instance => _instance;

  void toggleFavorite(Product product) {
    if (value.contains(product)) {
      value.remove(product);
    } else {
      value.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return value.contains(product);
  }
}
