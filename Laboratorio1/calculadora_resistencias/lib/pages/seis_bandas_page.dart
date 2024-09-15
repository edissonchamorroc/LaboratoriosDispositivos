import 'package:calculadora_resistencias/pages/home_page.dart';
import 'package:flutter/material.dart';

class SeisBandasPage extends StatefulWidget {
  const SeisBandasPage({super.key});

  @override
  State<SeisBandasPage> createState() => _SeisBandasPageState();
}

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

enum ColoresTolerancias {
  cafe(1, Colors.brown),
  rojo(2, Colors.red),
  dorado(5, Colors.yellow),
  plateado(10, Colors.grey);

  final int value;
  final Color color;

  const ColoresTolerancias(this.value, this.color);
}

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

class _SeisBandasPageState extends State<SeisBandasPage> {
  Colores? colorBanda1 = Colores.cafe;
  Colores? colorBanda2 = Colores.cafe;
  Colores? colorBanda3 = Colores.cafe;
  Colores? colorBanda4 = Colores.cafe;
  ColoresTolerancias? colorBanda5 = ColoresTolerancias.cafe;
  ColoresTemperatura? colorBanda6 = ColoresTemperatura.cafe;
  int valorBanda1 = 1;
  int valorBanda2 = 1;
  int valorBanda3 = 1;
  int valorBanda4 = 1;
  int valorBanda5 = 1;
  int valorBanda6 = 1;
  String? resultado;
  String? tolerancia;
  String? temperatura;
  bool isResultado = false;

  List<DropdownMenuItem<Colores>>? listadoValores() {
    return Colores.values.map((Colores color) {
      return DropdownMenuItem<Colores>(
        value: color,
        child: Row(
          children: [
            Container(
              width: 20,
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

  List<DropdownMenuItem<ColoresTolerancias>>? listadoValoresTolerancia() {
    return ColoresTolerancias.values.map((ColoresTolerancias color) {
      return DropdownMenuItem<ColoresTolerancias>(
        value: color,
        child: Row(
          children: [
            Container(
              width: 20, // Ancho del recuadro de color
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

  List<DropdownMenuItem<ColoresTemperatura>>? listadoValoresTemperatura() {
    return ColoresTemperatura.values.map((ColoresTemperatura color) {
      return DropdownMenuItem<ColoresTemperatura>(
        value: color,
        child: Row(
          children: [
            Container(
              width: 20, // Ancho del recuadro de color
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

  void _calculoValorResistencia() {
    resultado = valorBanda1.toString() +
        valorBanda2.toString() +
        valorBanda3.toString() +
        _ceros(valorBanda4);
    tolerancia = "$valorBanda5%";
    temperatura = "$valorBanda6 ppm";
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
        title: const Text("Resistencia seis bandas"),
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
                  "Leyendo las bandas de colores, de izquierda a derecha, las 4 primeras bandas nos determinarán su valor, la quinta banda nos indica su tolerancia y la sexta banda que representa el coeficiente de temperatura."),
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
                    DropdownButton<Colores>(
                      value: colorBanda4,
                      items: listadoValores(),
                      onChanged: (Colores? color4) {
                        setState(() {
                          colorBanda4 = color4;
                          valorBanda4 = color4!.value;
                        });
                      },
                    ),
                    DropdownButton<ColoresTolerancias>(
                      value: colorBanda5,
                      items: listadoValoresTolerancia(),
                      onChanged: (ColoresTolerancias? color5) {
                        setState(() {
                          colorBanda5 = color5;
                          valorBanda5 = color5!.value;
                        });
                      },
                    ),
                    DropdownButton<ColoresTemperatura>(
                      value: colorBanda6,
                      items: listadoValoresTemperatura(),
                      onChanged: (ColoresTemperatura? color6) {
                        setState(() {
                          colorBanda6 = color6;
                          valorBanda6 = color6!.value;
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
                    'El valor de la resistencia es de: $resultado Ω, con una tolerancia de: $tolerancia y una resistencia a la temperatura de: $temperatura'),
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
