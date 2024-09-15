import 'package:flutter/material.dart';

enum ColoresTolerancias {
  cafe(1, Colors.brown),
  rojo(2, Colors.red),
  dorado(5, Colors.yellow),
  plateado(10, Colors.grey);

  final int value;
  final Color color;

  const ColoresTolerancias(this.value, this.color);
}