
import 'package:exemplo01/segundapag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 class Pessoa
 {
  final String nome;
  final String tel;
  //construtor
  const Pessoa( this.nome, this.tel);
 }
void main() {
  runApp( const MaterialApp (title: "App",
      home: MainApp(),));
}

// O construtor será alterado para utilizarmos Stateful
//class MainApp extends StatelessWidget {
//  const MainApp({super.key});
class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State<MainApp> {
//variaveis locais para receber o texto
String nme = '';
String fone = '';

  @override
  void initState() {
    super.initState();
    }
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
            const Text('Exemplo de Formulário'),
            //TextFormField é um texto para entrada de dados 
            //Pode ser decoradpo para ficar mais bonito visualmente
            TextFormField(
                decoration: const InputDecoration(
                  icon:  Icon(Icons.person),
                  hintText: 'Entrada de texto',
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  
                  
                ),
                  keyboardType: TextInputType.name,
                   inputFormatters: <TextInputFormatter>[
                       FilteringTextInputFormatter.singleLineFormatter
                    ],
                 //associa o valor do campo à variável
                 onChanged: (value) {
                            nme = value;
                          },
              ),
              //o const é solicitado ´pois ainda não há tratamento
               TextFormField(
              decoration:  const InputDecoration(
                
              icon: Icon(Icons.phone),
              //inclui uma borda no elemento
              border: OutlineInputBorder(),
              hintText: 'Informe um Telefone',
              labelText: 'Telefone'
              
            ),
              keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                 FilteringTextInputFormatter.digitsOnly
              ],
             onChanged: (value) {
                            fone = value;
                          },
          ),
          
          //ambos os Text tem funcionalidades similares,
          //o FormField disponibiliza mais recursos
          ElevatedButton(onPressed:(){
            
            Pessoa p =  Pessoa(nme, fone);

             Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                       (context) => const SegundaPag(),
                       //adiciona os parametros 
                       settings: RouteSettings(
                    arguments: p,
                  ),),
                        
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
