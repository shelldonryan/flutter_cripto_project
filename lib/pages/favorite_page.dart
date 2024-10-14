import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/repositories/favorite_repository.dart';
import 'package:provider/provider.dart';

import '../widgets/coin_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Page"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<FavoriteRepository>(builder: (context, favorite, child) {
          return favorite.list.isEmpty ? const ListTile(
            leading: Icon(Icons.start, color: Colors.black54,),
            title: Text("Don't selected any coin with favorite"),
          ) : ListView.builder(
            itemCount: favorite.list.length,
            itemBuilder: (_, index) {
              return CoinCard(coin: favorite.list[index]);
            },
          );
        }),
      ),
    );
  }
}