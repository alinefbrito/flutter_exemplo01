


import 'dart:html';

import 'package:exemplo01/segundapag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:exemplo01/pet.dart';
import 'package:flutter/widgets.dart';
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


//lista pets
List<Pet> pets =List.generate(5, (i) => Pet('Pet $i',  
                                          DateTime(2010,10,11), 
                                          'img/list/$i.gif'));
//variaveis locais para receber o texto
String nme = '';
String nasc  = '';

addLista()
{
Pet p =  Pet(nme, DateTime.parse( nasc.split('/').reversed.join()), 'img/puppy.jpg');

setState(() =>pets.add(p));

}


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
              title: const Text('Meu Pet'),
              //centraliza o título
              centerTitle: true,
              //muda a cor do background
               backgroundColor: Colors.pink.shade400,
               //adicionar botões de ação antes do título
               
                ),
        body:  Center(
          child:Padding(padding:const EdgeInsets.all(10.5) ,
          child:Column(
           //Alinha no centro da página - vertical - , 
           //com distribuição uniforme
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:<Widget>[ 
            const Text('Cadastro Pet'),
            //TextFormField é um texto para entrada de dados 
            //Pode ser decoradpo para ficar mais bonito visualmente
            TextFormField(
                decoration: const InputDecoration(
                  icon:  Icon(Icons.person),
                  hintText: 'Nome do Seu Pet',
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
              hintText: 'Informe a data de nascimento aproximada do seu Pet',
              labelText: 'Nascimento'
              
            ),
              keyboardType: TextInputType.datetime,
                inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp("[0-9/]"),replacementString: ''),
  ],
             onChanged: (value) {
                            nasc = value ;
                          },
          ),
          
          //ambos os Text tem funcionalidades similares,
          //o FormField disponibiliza mais recursos
         
         Image.asset(  'img/puppy.jpg',width: 120,height: 120,),
          ElevatedButton(onPressed:addLista, //botão irá enviar para página dois
                        child: const Text('Add pet')),
      
      ListView.builder(
         itemCount: pets.length,
         shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext, index){
          return Card( 
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(pets[index].pathimg),),
              title: Text(pets[index].nome),
              subtitle: Text(pets[index].nascimento.toString()),
              onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                       (context) => const SegundaPag(),
                       //adiciona os parametros 
                       settings: RouteSettings(
                    arguments:pets[index],
                  ),),
                        
                         ),
              
            ),
          ) ;
        },
                )
  
               
      
            ]
          )),
      ),
    ));
  }
}
