import 'package:flutter/material.dart';

class CalculadoraImcPage extends StatefulWidget {
  const CalculadoraImcPage({super.key});

  @override
  State<CalculadoraImcPage> createState() => _CalculadoraImcPageState();
}

class _CalculadoraImcPageState extends State<CalculadoraImcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
