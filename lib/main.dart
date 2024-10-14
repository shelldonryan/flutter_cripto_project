import 'package:flutter/material.dart';
import 'package:flutter_cripto_project/repositories/favorite_repository.dart';
import 'package:provider/provider.dart';
import 'my_application.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteRepository(),
      child: const MyApp(),
    ),
  );
}
