import 'package:flutter/material.dart';

enum ColoresTemperatura {
  cafe(100, Colors.brown),
  rojo(50, Colors.red),
  naranja(15, Colors.orange),
  amarillo(25, Colors.yellow),
  azul(10, Colors.blue),
  violeta(5, Colors.purple);

  final int value;
  final Color color;

  const ColoresTemperatura(this.value, this.color);
}
