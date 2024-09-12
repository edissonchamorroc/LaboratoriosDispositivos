import 'package:flutter/material.dart';

class ConversorPage extends StatefulWidget {
  const ConversorPage({super.key});

  @override
  State<ConversorPage> createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {
  final _valor1 = TextEditingController();
  final _valor2 = TextEditingController();
  String? moneda1;
  String? moneda2;
  var _resultado = 0.0;

  void _conversion() {
    setState(() {
      if (moneda1 == "pesos" && moneda2 == "dolar") {
        _resultado = double.parse(_valor1.text) * 0.00023;
      } else if (moneda1 == "pesos" && moneda2 == "euro") {
        _resultado = double.parse(_valor1.text) * 0.00021;
      } else if (moneda1 == "dolar" && moneda2 == "pesos") {
        _resultado = double.parse(_valor1.text) * 4236.85;
      } else if (moneda1 == "dolar" && moneda2 == "euro") {
        _resultado = double.parse(_valor1.text) * 0.91;
      } else if (moneda1 == "euro" && moneda2 == "pesos") {
        _resultado = double.parse(_valor1.text) * 4706.50;
      } else if (moneda1 == "euro" && moneda2 == "dolar") {
        _resultado = double.parse(_valor1.text) * 0.00023;
      } else {
        _resultado = 1.0;
      }
    });
  }

  void _asignacionValor() {
    setState(() {
      if (_valor1.text.isEmpty) {
        _conversion();
        _valor1.text = _resultado.toString();
      } else {
        _conversion();
        _valor2.text = _resultado.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor Moneda"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/intercambio.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Elija la moneda base",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: IntrinsicWidth(
                            child: TextFormField(
                      controller: _valor1,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.monetization_on_rounded)),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          moneda2 = null;
                          _valor2.text = "";
                        });
                      },
                    ))),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: IntrinsicWidth(
                            child: DropdownButton(
                      value: moneda1,
                      hint: const Text("Seleccione"),
                      items: const [
                        DropdownMenuItem(value: "dolar", child: Text("Dolar")),
                        DropdownMenuItem(value: "pesos", child: Text("COP")),
                        DropdownMenuItem(value: "euro", child: Text("Euro")),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          moneda1 = value!;
                          _asignacionValor();
                        });
                      },
                    )))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Elija la moneda a convertir",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: _valor2,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.monetization_on_rounded)),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          moneda1 = null;
                          _valor1.text = "";
                        });
                      },
                    )),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: DropdownButton(
                      value: moneda2,
                      hint: const Text("Seleccione"),
                      items: const [
                        DropdownMenuItem(value: "dolar", child: Text("Dolar")),
                        DropdownMenuItem(value: "pesos", child: Text("COP")),
                        DropdownMenuItem(value: "euro", child: Text("Euro")),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          moneda2 = value!;
                          _asignacionValor();
                        });
                      },
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
