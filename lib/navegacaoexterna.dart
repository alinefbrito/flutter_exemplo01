
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void navegpag() {
  runApp(const NavegPag());
}

class NavegPag extends StatelessWidget {
  const NavegPag({super.key});

Future<void> _launchURL() async {
   final Uri url = Uri.parse('https://masp.org.br/');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }}

@override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar:  AppBar(
        title:const  Text('Terceira Tela'),
        backgroundColor:const Color.fromARGB(255, 66, 2, 82),
      ),
      body: Center(child: Column(children:
      [const Text("Abrir App Externa"),
      
  
         ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Web'),
        ),
     ] ),
    ));
  }
}