import 'package:aplicacion/pages/conversor_hexa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor hexadecimal',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(54, 218, 163, 1)),
        useMaterial3: true,
      ),
      home: const ConversorHexa(),
    );
  }
}

