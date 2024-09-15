import 'package:flutter/material.dart';

class Calculo extends StatefulWidget {
  const Calculo({super.key});

  @override
  State<Calculo> createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  final _notaLaboratorios = TextEditingController();
  final _primerAvanceProyecto = TextEditingController();
  final _segundoAvanceProyecto = TextEditingController();
  final _proyectoFinal = TextEditingController();
  var _noCalculado = true;
  double? suma;
  String? _nota;
  void _validarCamposVacios() {
    if (_notaLaboratorios.text.isEmpty) {
      _notaLaboratorios.text = '0';
    }
    if (_primerAvanceProyecto.text.isEmpty) {
      _notaLaboratorios.text = '0';
    }
    if (_segundoAvanceProyecto.text.isEmpty) {
      _notaLaboratorios.text = '0';
    }
    if (_proyectoFinal.text.isEmpty) {
      _notaLaboratorios.text = '0';
    }
  }

  void _cambiarVisibilidad() {
    _noCalculado = !_noCalculado;
  }

  void _calculoNotaFinal() {
    setState(() {
      _validarCamposVacios();
      var nota1 = double.parse(_notaLaboratorios.text);
      var nota2 = double.parse(_primerAvanceProyecto.text);
      var nota3 = double.parse(_segundoAvanceProyecto.text);
      var nota4 = double.parse(_proyectoFinal.text);
      suma = nota1 * 0.6 + nota2 * 0.1 + nota3 * 0.08 + nota4 * 0.22;
      _nota = suma?.toStringAsFixed(2);
      _cambiarVisibilidad();
    });
  }

  void _regresar() {
    setState(() {
      _notaLaboratorios.text = "";
      _primerAvanceProyecto.text = "";
      _segundoAvanceProyecto.text = "";
      _proyectoFinal.text = "";
      _cambiarVisibilidad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculo Nota Final"),
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
                  image: AssetImage('assets/images/notas.png'),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Visibility(
                  visible: _noCalculado,
                    child: const Text(
                  "Agrege la nota correspondiente",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                )),
                Column(
                  children: [
                    Visibility(
                        visible: !_noCalculado,
                        child: Text(
                          'La nota es $_nota',
                          style: const TextStyle(
                              fontSize: 25, fontStyle: FontStyle.italic),
                        )),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Visibility(
                        visible: !_noCalculado,
                        child: ElevatedButton(
                            onPressed: () {
                              _regresar();
                            },
                            child: const Text("Regresar")))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: TextFormField(
                              controller: _notaLaboratorios,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                            ))),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: const Text("Laboratorios")))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: TextFormField(
                              controller: _primerAvanceProyecto,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ))),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: const Text("Primer avance proyecto")))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: TextFormField(
                              controller: _segundoAvanceProyecto,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                            ))),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: const Text("Segundo avance proyecto")))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: TextFormField(
                              controller: _proyectoFinal,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                            ))),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: Visibility(
                            visible: _noCalculado,
                            child: const Text("Entrega proyecto")))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Visibility(
                    visible: _noCalculado,
                    child: ElevatedButton(
                      onPressed: () => {
                        _calculoNotaFinal(),
                      },
                      child: const Text('Calcular'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
