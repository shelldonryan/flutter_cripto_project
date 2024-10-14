import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/models/coin.dart';

class FavoriteRepository extends ChangeNotifier {
  List<Coin> _coins = [];

  UnmodifiableListView<Coin> get list => UnmodifiableListView(_coins);

  saveAllCoins(List<Coin> coins) {
    for (Coin coin in coins) {
      if (!list.contains(coin)) {
        _coins.add(coin);
      }
    }

    notifyListeners();
  }

  removeCoin(Coin coin) {
    _coins.remove(coin);
    notifyListeners();
  }
}