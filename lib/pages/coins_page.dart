import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/models/coin.dart';
import 'package:flutter_cripto_project/pages/coin_detail_page.dart';
import 'package:flutter_cripto_project/repositories/coin_repository.dart';
import 'package:intl/intl.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  final table = CoinRepository.table;
  List<Coin> selected = [];
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  _appBarDynamic() {
    if (selected.isEmpty) {
      return AppBar(
        title: const Center(child: Text('Crypto Currency')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      );
    } else {
      return AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                selected = [];
              });
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('${selected.length} selected'),
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white70),
        titleTextStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  _showDetails(Coin coin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CoinDetailPage(coin: coin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarDynamic(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int coin) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: (selected.contains(table[coin]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(width: 40, child: Image.asset(table[coin].icon)),
            title: Text(
              table[coin].name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(table[coin].acronym),
            trailing: Text(
              real.format(table[coin].price),
            ),
            selected: selected.contains(table[coin]),
            selectedTileColor: Colors.red[100],
            onLongPress: () {
              setState(() {
                selected.contains(table[coin])
                    ? selected.remove(table[coin])
                    : selected.add(table[coin]);
              });
            },
            onTap: () => _showDetails(table[coin]),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: table.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selected.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.star),
              label: const Text(
                "bookmark",
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
