import 'package:calculadora_resistencias/pages/colores_tolerancias.dart';
import 'package:calculadora_resistencias/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'colores.dart';

class CuatroBandasPage extends StatefulWidget {
  const CuatroBandasPage({super.key});

  @override
  State<CuatroBandasPage> createState() => _CuatroBandasPageState();
}

class _CuatroBandasPageState extends State<CuatroBandasPage> {
  Colores? colorBanda1 = Colores.cafe;
  Colores? colorBanda2 = Colores.cafe;
  Colores? colorBanda3 = Colores.cafe;
  ColoresTolerancias? colorBanda4 = ColoresTolerancias.cafe;
  int valorBanda1 = 1;
  int valorBanda2 = 1;
  int valorBanda3 = 1;
  int valorBanda4 = 1;
  String? resultado;
  String? tolerancia;
  bool isResultado = false;

  List<DropdownMenuItem<Colores>>? listadoValores() {
    return Colores.values.map((Colores color) {
      return DropdownMenuItem<Colores>(
        value: color,
        child: Row(
          children: [
            Container(
              width: 48, // Ancho del recuadro de color
              height: 100, // Alto del recuadro de color
              decoration: BoxDecoration(
                color: color.color,
                borderRadius: BorderRadius.circular(12),
              ),
            ), // Mostrar el valor numérico del color
          ],
        ),
      );
    }).toList();
  }

  List<DropdownMenuItem<ColoresTolerancias>>? listadoValoresTolerancia() {
    return ColoresTolerancias.values.map((ColoresTolerancias color) {
      return DropdownMenuItem<ColoresTolerancias>(
        value: color,
        child: Row(
          children: [
            Container(
              width: 48, 
              height: 100, 
              decoration: BoxDecoration(
                color: color.color,
                borderRadius: BorderRadius.circular(12),
              ),
            ), 
          ],
        ),
      );
    }).toList();
  }

  void _calculoValorResistencia() {
    resultado =
        valorBanda1.toString() + valorBanda2.toString() + _ceros(valorBanda3);
    tolerancia = "$valorBanda4%";
    isResultado = true;
  }

  String _ceros(int multiplicador) {
    String resultado = "";
    switch (multiplicador) {
      case 1:
        resultado = '0';
        break;
      case 2:
        resultado = '00';
        break;
      case 3:
        resultado = 'K';
        break;
      case 4:
        resultado = '0K';
        break;
      case 5:
        resultado = '00K';
        break;
      case 6:
        resultado = 'M';
        break;
      case 7:
        resultado = '0M';
        break;
      case 8:
        resultado = '00M';
        break;
      case 9:
        resultado = 'G';
        break;
      default:
        break;
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resistencia cuatro bandas"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Seleccione el color de las bandas",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Lease de izquierda a derecha",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                  "Leyendo las bandas de colores, de izquierda a derecha, las 3 primeras bandas nos determinarán su valor, la cuarta banda nos indica su tolerancia"),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, bottom: 10.0, right: 0.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 231, 165, 126),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    DropdownButton<Colores>(
                      value: colorBanda1,
                      items: listadoValores(),
                      onChanged: (Colores? color1) {
                        setState(() {
                          colorBanda1 = color1;
                          valorBanda1 = color1!.value;
                        });
                      },
                    ),
                    DropdownButton<Colores>(
                      value: colorBanda2,
                      items: listadoValores(),
                      onChanged: (Colores? color2) {
                        setState(() {
                          colorBanda2 = color2;
                          valorBanda2 = color2!.value;
                        });
                      },
                    ),
                    DropdownButton<Colores>(
                      value: colorBanda3,
                      items: listadoValores(),
                      onChanged: (Colores? color3) {
                        setState(() {
                          colorBanda3 = color3;
                          valorBanda3 = color3!.value;
                        });
                      },
                    ),
                    DropdownButton<ColoresTolerancias>(
                      value: colorBanda4,
                      items: listadoValoresTolerancia(),
                      onChanged: (ColoresTolerancias? color4) {
                        setState(() {
                          colorBanda4 = color4;
                          valorBanda4 = color4!.value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _calculoValorResistencia();
                  });
                },
                child: const Text("Calcular"),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Visibility(
                visible: isResultado,
                child: Text(
                    'El valor de la resistencia es de: $resultado Ω y con una tolerancia de: $tolerancia'),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text("Regresar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
