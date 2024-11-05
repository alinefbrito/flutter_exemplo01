



// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:exemplo01/navegacaoexterna.dart';

import 'package:flutter/material.dart';
 import 'package:flutter_sensors/flutter_sensors.dart';
void sensores() {
 runApp(const Sensores());
}

// O construtor será alterado para utilizarmos Stateful
//class MainApp extends StatelessWidget {
//  const MainApp({super.key});
class Sensores extends StatefulWidget {
  const Sensores({super.key});


  @override
  SensoresAPP createState() => SensoresAPP();
}

class SensoresAPP extends State<Sensores> {
 //cria um controlador que permite ir ao fim da lista(listview)
 final ScrollController _controller = ScrollController();
    void _scrollDown() {
  _controller.animateTo(
    _controller.position.maxScrollExtent,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
  );
}


bool _accelAvailable = false;
  bool _gyroAvailable = false;
  List<double> _accelData = List.filled(3, 0.0);
  List<double> _gyroData = List.filled(3, 0.0);
  StreamSubscription? _accelSubscription;
  StreamSubscription? _gyroSubscription;

//List<int> sensoresdisponiveis=List.empty();
  @override
  void initState() {
    _checkAccelerometerStatus();
    _checkGyroscopeStatus();
   //_checkAllSensors();
    super.initState();
  }

  @override
  void dispose() {
    _stopAccelerometer();
    _stopGyroscope();
    super.dispose();
  }

  void _checkAllSensors() async{
    for (var i = 0; i < 20; i++) {
      await SensorManager()
        .isSensorAvailable(i)
        .then((result) {
      setState(() {
        //sensoresdisponiveis.add(i);
        
      });
    });
    }
  }

  void _checkAccelerometerStatus() async {
    await SensorManager()
        .isSensorAvailable(Sensors.ACCELEROMETER)
        .then((result) {
      setState(() {
        _accelAvailable = result;
        
      });
    });
  }

  Future<void> _startAccelerometer() async {
    if (_accelSubscription != null) return;
    if (_accelAvailable) {
      final stream = await SensorManager().sensorUpdates(
        sensorId: Sensors.ACCELEROMETER,
        interval: Sensors.SENSOR_DELAY_FASTEST,
      );
      _accelSubscription = stream.listen((sensorEvent) {
        setState(() {
          _accelData = sensorEvent.data;
        });
      });
    }
  }

  void _stopAccelerometer() {
    if (_accelSubscription == null) return;
    _accelSubscription?.cancel();
    _accelSubscription = null;
  }

  void _checkGyroscopeStatus() async {
    await SensorManager().isSensorAvailable(Sensors.GYROSCOPE).then((result) {
      setState(() {
        _gyroAvailable = result;
      });
    });
  }

  Future<void> _startGyroscope() async {
    if (_gyroSubscription != null) return;
    if (_gyroAvailable) {
      final stream =
          await SensorManager().sensorUpdates(sensorId: Sensors.GYROSCOPE);
      _gyroSubscription = stream.listen((sensorEvent) {
        setState(() {
          _gyroData = sensorEvent.data;
        });
      });
    }
  }

  void _stopGyroscope() {
    if (_gyroSubscription == null) return;
    _gyroSubscription?.cancel();
    _gyroSubscription = null;
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
            
         Image.asset(  'img/puppy.jpg',width: 120,height: 120,),
          
        //ajusta o listview para utilizar o espaço  sem estourar o tamanho
                     
      ListView.builder(
              //define o tamanho do listview a partir do tamanho da lista
         itemCount: sensoresdisponiveis.length,
         shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        controller: _controller,
        clipBehavior: Clip.antiAlias,
        itemBuilder: (BuildContext ctx, index){
          return Text(sensoresdisponiveis[index] as String);
        },
                )
            ]
          )),
      ),
    ));
  }
}
