import 'package:calculadora_resistencias/pages/cinco_bandas_page.dart';
import 'package:calculadora_resistencias/pages/cuatro_bandas_page.dart';
import 'package:calculadora_resistencias/pages/seis_bandas_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcula Resistencia"),
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
                  image: AssetImage('assets/images/resistor.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Cuantas bandas tiene tu resistencia?",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CuatroBandasPage(),
                      ),
                    );
                  },
                  child: const Text("cuatro bandas"),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CincoBandasPage(),
                      ),
                    );
                  },
                  child: const Text("cinco bandas"),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SeisBandasPage(),
                      ),
                    );
                  },
                  child: const Text("seis bandas"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
