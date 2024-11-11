import 'package:flutter/material.dart';
import 'package:ticket_master/pages/Navigation_bar_page.dart';

void main() {
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

