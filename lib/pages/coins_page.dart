import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/models/coin.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cripto Moedas')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int coin) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: SizedBox(width: 40, child: Image.asset(table[coin].icon)),
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
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: table.length,
      ),
    );
  }
}
