import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/models/coin.dart';
import 'package:flutter_cripto_project/pages/coin_detail_page.dart';
import 'package:flutter_cripto_project/repositories/favorite_repository.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CoinCard extends StatefulWidget {
  Coin coin;

  CoinCard({super.key, required this.coin});

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

  _openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CoinDetailPage(coin: widget.coin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 4,
      child: InkWell(
        onTap: () => _openDetails(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.asset(
                widget.coin.icon,
                height: 40,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coin.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.coin.acronym,
                        style: const TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.05),
                    border: Border.all(color: Colors.red.withOpacity(0.04)),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  real.format(widget.coin.price),
                  style: const TextStyle(
                      fontSize: 16, letterSpacing: -1, color: Colors.red),
                ),
              ),
              PopupMenuButton(
                  icon: const Icon(Icons.more_horiz),
                  itemBuilder: (context) => [
                    PopupMenuItem(child: ListTile(
                      title: const Text("remove coin"),
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<FavoriteRepository>(context, listen: false)
                        .removeCoin(widget.coin);
                      },
                    ))
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
