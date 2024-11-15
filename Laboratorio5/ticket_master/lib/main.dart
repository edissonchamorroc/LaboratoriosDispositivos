import 'package:flutter/material.dart';
import 'package:ticket_master/pages/Navigation_bar_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ticket_master/respository/hive_api.dart';

void main() async{
  await Hive.initFlutter();
  await HiveApi.initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Master',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 82, 156, 241)),
        useMaterial3: true,
      ),
      home: const NavigationBarPage(),
    );
  }
}

