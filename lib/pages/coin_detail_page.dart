import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cripto_project/models/coin.dart';
import 'package:intl/intl.dart';

class CoinDetailPage extends StatefulWidget {
  Coin coin;

  CoinDetailPage({super.key, required this.coin});

  @override
  State<CoinDetailPage> createState() => _CoinDetailPageState();
}

class _CoinDetailPageState extends State<CoinDetailPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController _valueController = TextEditingController();
  double quantity = 0;

  _buy() {
    if (_keyForm.currentState!.validate()) {
      // save purchase

      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Purchase made successfully"),
        ),
      );
    }
  }

  acquire() {
    if (_keyForm.currentState!.validate()) {
      // save acquire of the coin

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('The acquire of ${widget.coin.acronym} was realize')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset(widget.coin.icon),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    real.format(widget.coin.price),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            (quantity > 0)
            ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                alignment: Alignment.center,
                child: Text('$quantity ${widget.coin.acronym}', style: const TextStyle(fontSize: 20, color: Colors.teal,),),
              ),
            ) : Container(
              margin: const EdgeInsets.all(24),
            ),
            Form(
              key: _keyForm,
              child: TextFormField(
                controller: _valueController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'value',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                  suffix: Text(
                    'reais',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input the value here';
                  } else if (double.parse(value) < 50) {
                    return 'Minimum purchase of 50 reais';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      quantity = double.parse(value) / widget.coin.price;
                    } else {
                      quantity = 0;
                    }
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                  onPressed: _buy,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('buy'),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
