
import 'package:exemplo01/segundapag.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //define o titulo da app
              title: const Text('Exemplo 01'),
              //centraliza o título
              centerTitle: true,
              //muda a cor do background
               backgroundColor: Colors.pink.shade400,
               //adicionar botões de ação antes do título
               leading: 
               IconButton(onPressed: () {} , icon:const Icon(Icons.menu),),
               //inclui os botões após o título
                actions: [
                  IconButton(onPressed: () {} , icon:const Icon(Icons.dining) ),
                  IconButton(onPressed: () {} , icon:const Icon(Icons.no_food) ),
                ],
                ),
        body:  Center(
          child:Column(
           //Alinha no centro da página - vertical - , 
           //com distribuição uniforme
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:<Widget>[ 
            const Text('Texto simples'),
            //TextFormField é um texto para entrada de dados 
            //Pode ser decoradpo para ficar mais bonito visualmente
            TextFormField(
                decoration: const InputDecoration(
                  icon:  Icon(Icons.person),
                  hintText: 'Entrada de texto',
                  labelText: 'Nome',
                  
                ),
              ),
              //o const é solicitado ´pois ainda não há tratamento
              const TextField(
              decoration:  InputDecoration(
              icon: Icon(Icons.phone),
              border: OutlineInputBorder(),
              hintText: 'Informe um Telefone',
              labelText: 'Telefone'
              
            ),
          ),
          
          //ambos os Text tem funcionalidades similares,
          //o FormField disponibiliza mais recursos
          ElevatedButton(onPressed:(){
             Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                       (context) => const SegundaPag()),
                         );
          }, //botão irá enviar para página dois
                        child: const Text('Enviar')),
         Image.asset(
      'img/img01.jpg',width: 220,height: 220,),
  
               
      
            ]
          )),
      ),
    );
  }
}
