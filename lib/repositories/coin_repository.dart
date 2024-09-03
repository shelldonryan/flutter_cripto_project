import 'package:flutter_cripto_project/models/coin.dart';

class CoinRepository {
  static List<Coin> table = [
    Coin(icon: 'images/bitcoin_icon.png', name: 'Bitcoin', acronym: 'BTC', price: '325000'),
    Coin(icon: 'images/ethereum_icon.png', name: 'Ethereum', acronym: 'ETH', price: '13774'),
    Coin(icon: 'images/solana_icon.png', name: 'Solana', acronym: 'SOL', price: '734'),
  ];
}