



// ignore_for_file: non_constant_identifier_names

import 'package:exemplo01/navegacaoexterna.dart';
import 'package:exemplo01/segundapag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:exemplo01/pet.dart';
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
 //cria um controlador que permite ir ao fim da lista(listview)
 final ScrollController _controller = ScrollController();
    void _scrollDown() {
  _controller.animateTo(
    _controller.position.maxScrollExtent,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn
    ,
  );
}

//lista pets
//List<Pet> pets =List.generate(5, (i) => Pet('Pet $i',  
                                          //DateTime(2010,10,11),  'img/list/$i.gif'));
 
 List<Pet> pets = [Pet('pet 1', DateTime(2024,03,10), 'img/list/0.gif' ),
                    Pet('pet 2', DateTime(2024,05,01), 'img/list/1.gif'),
                    Pet('pet 3', DateTime(2024,05,01), 'img/list/2.gif'),
                    Pet('pet 4', DateTime(2024,05,01), 'img/list/3.gif'),
                    Pet('pet 5', DateTime(2024,05,01), 'img/list/4.gif'),
                    Pet('pet 6', DateTime(2024,05,01), 'img/list/5.gif')];                                      
//variaveis locais para receber o texto
String nme = '';
String nasc  = '';

addLista()
{
Pet p =  Pet(nme, DateTime.parse( nasc.split('/').reversed.join()), 'img/puppy.jpg');

setState(() =>pets.add(p));
_scrollDown();

}


  @override
  void initState() {
    super.initState();
    }

   
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(resizeToAvoidBottomInset: true,
         floatingActionButton: FloatingActionButton.small(
      onPressed:_scrollDown,
      child: const Icon(Icons.arrow_downward_sharp,),
    ),
        appBar: AppBar(
          //define o titulo da app
              title: const Text('Meu Pet'),
              //centraliza o título
              centerTitle: true,
              //muda a cor do background
               backgroundColor: Colors.pink.shade400,
               leading: 
               IconButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                       (context) => const NavegPag(),
                       //adiciona os parametros 
                       ),
                        
                         );
               } , icon:const Icon(Icons.navigate_next_sharp),),
               //inclui os botões após o título
                actions: [
                  IconButton(onPressed: () {} , icon:const Icon(Icons.dining) ),
                  IconButton(onPressed: () {} , icon:const Icon(Icons.no_food) ),
                ],
               //adicionar botões de ação antes do título
               
                ),
        body:  Center(
          child:Padding(padding:const EdgeInsets.all(8.5) ,
          child:Column(
           //Alinha no centro da página - vertical - , 
           //com distribuição uniforme
           mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              //adiciona um espaço para melhorar o layout
              const SizedBox(height: 10,),
              //o const é solicitado ´pois ainda não há tratamento
               TextFormField(
              decoration:  const InputDecoration(
                
              icon: Icon(Icons.edit_calendar),
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
        //ajusta o listview para utilizar o espaço  sem estourar o tamanho
        Expanded(
          //inicia o construtor do list view
            child:ListView.builder(
              //define o tamanho do listview a partir do tamanho da lista
         itemCount: pets.length,
         shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        controller: _controller,
        clipBehavior: Clip.antiAlias,
        itemBuilder: (BuildContext ctx, index){
          return Card( 
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(pets[index].pathimg),),
              title: Text(pets[index].nome),
              subtitle: Text(pets[index].dataNascFormatada().toString()),
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
                ))
  
               
      
            ]
          )),
      ),
    ));
  }
}
