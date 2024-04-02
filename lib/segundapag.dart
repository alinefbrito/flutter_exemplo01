import 'package:flutter/material.dart';
import 'package:exemplo01/main.dart';

void segundapag() {
  runApp(const SegundaPag());
}

class SegundaPag extends StatelessWidget {
  const SegundaPag({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Botão que voltará ´para a tela anterior
          },
          child: const Text('Voltar!'),
        ),
      ),
    );
  }
}