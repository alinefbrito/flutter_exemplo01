import 'package:flutter/material.dart';

void segundapag() {
  runApp(const SegundaPag());
}

class SegundaPag extends StatelessWidget {
  const SegundaPag({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:const  Text('Segunda Tela'),
        backgroundColor:const  Color.fromARGB(255, 8, 148, 148),
      ),
      body: Center(child: Column(children:
      [const Text("Dados Recebidos"),
      Image.asset(
      'img/img02.jpg',width: 220,height: 220,),
  
         ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Voltar!'),
        ),
     ] ),
    ));
  }
}