import 'dart:developer';

import 'package:flutter/material.dart';

class CalculadoraImcPage extends StatefulWidget {
  const CalculadoraImcPage({super.key});

  @override
  State<CalculadoraImcPage> createState() => _CalculadoraImcPageState();
}

class _CalculadoraImcPageState extends State<CalculadoraImcPage> {
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
              onPressed: () {},
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
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ElevatedButton(
                  onPressed: () {
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
              const Text(
                "Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
