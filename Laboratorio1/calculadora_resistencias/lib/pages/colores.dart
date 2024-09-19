import 'package:flutter/material.dart';

enum Colores {
  cafe(1, Colors.brown),
  rojo(2, Colors.red),
  naranja(3, Colors.orange),
  amarillo(4, Colors.yellow),
  verde(5, Colors.green),
  azul(6, Colors.blue),
  violeta(7, Colors.purple),
  gris(8, Colors.grey),
  blanco(9, Colors.white),
  negro(0, Colors.black);

  final int value;
  final Color color;

  const Colores(this.value, this.color);
}