import 'package:exemplo01/pet.dart';

class TutorPet
{
   final String nome;
  final DateTime nascimento;
  final String pathimg;
  //late Pet p;
  late List<Pet> pets ;

  TutorPet({required this.nome, required this.nascimento, required this.pathimg, required this.pets});
  //construtor
  
}