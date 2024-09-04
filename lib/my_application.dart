import 'package:flutter/material.dart';
import 'pages/coins_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'criptoApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(onPrimary: Colors.white),
      ),
      home: const CoinsPage(),
    );
  }
}