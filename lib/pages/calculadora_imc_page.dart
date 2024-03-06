import 'dart:developer';

import 'package:flutter/material.dart';

class CalculadoraImcPage extends StatefulWidget {
  const CalculadoraImcPage({super.key});

  @override
  State<CalculadoraImcPage> createState() => _CalculadoraImcPageState();
}

class _CalculadoraImcPageState extends State<CalculadoraImcPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetFields() {
    setState(() {
      weightController.text = '';
      heightController.text = '';
      _infoText = "Informe seus dados";
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      // conversão pq a altura precisa ser em metros para o calculo
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);
      String imcAsPrecision = imc.toStringAsPrecision(3);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso ($imcAsPrecision)";
      } else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal ($imcAsPrecision)";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso ($imcAsPrecision)";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau 1 ($imcAsPrecision)";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau 2 ($imcAsPrecision)";
      }else if(imc >= 40){
        _infoText = "Obesidade Grau 3 ($imcAsPrecision)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculadora de IMC',
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _resetFields();
                log("reset de campos");
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_2_outlined,
                  size: 120.0, color: Colors.blue),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: heightController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    calculate();
                    log('Clique no calcular');
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.all(16.0),
                    ),
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
