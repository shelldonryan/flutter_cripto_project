import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/models/coin.dart';

class CoinDetailPage extends StatefulWidget {
  Coin coin;

  CoinDetailPage({super.key, required this.coin});

  @override
  State<CoinDetailPage> createState() => _CoinDetailPageState();
}

class _CoinDetailPageState extends State<CoinDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
    );
  }
}