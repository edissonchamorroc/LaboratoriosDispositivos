import 'package:flutter/material.dart';

class ConversorHexa extends StatefulWidget {
  const ConversorHexa({super.key});

  @override
  State<ConversorHexa> createState() => _ConversorHexaState();
}

class _ConversorHexaState extends State<ConversorHexa> {
  final _binario = TextEditingController();
  String binario = "";
  String salto = "";
  String hexadecimal = "";

  void concatenarUno() {
    setState(() {
      if (binario.length < 4) {
        binario += "1";
        _binario.text = binario;
      } else {
        salto = "1";
        conversion();
      }
    });
  }

  void concatenarCero() {
    setState(() {
      if (binario.length < 4) {
        binario += "0";
        _binario.text = binario;
      } else {
        salto = "0";
        conversion();
      }
    });
  }

  void conversion() {
    setState(() {
      hexadecimal += valores(binario);
      binario = "";
      binario = salto;
      _binario.text = binario;
    });
  }

  String valores(String binario) {
    String hexa = "";
    switch (binario) {
      case "0000":
        hexa = "0";
        break;
      case "0001":
        hexa = "1";
        break;
      case "0010":
        hexa = "2";
        break;
      case "0011":
        hexa = "3";
        break;
      case "0100":
        hexa = "4";
        break;
      case "0101":
        hexa = "5";
        break;
      case "0110":
        hexa = "6";
        break;
      case "0111":
        hexa = "7";
        break;
      case "1000":
        hexa = "8";
        break;
      case "1001":
        hexa = "9";
        break;
      case "1010":
        hexa = "A";
        break;
      case "1011":
        hexa = "B";
        break;
      case "1100":
        hexa = "C";
        break;
      case "1101":
        hexa = "D";
        break;
      case "1110":
        hexa = "E";
        break;
      case "1111":
        hexa = "F";
        break;
    }
    return hexa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de binario a hexadecimal"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hexadecimal,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Ingrese el binario",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _binario,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          concatenarUno();
                        },
                        child: const Text(
                          "1",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          concatenarCero();
                        },
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
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
