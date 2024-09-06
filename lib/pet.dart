

class Pet
 {
  final String nome;
  final DateTime nascimento;
  final String pathimg;
  late int idade;
  //construtor
   Pet( this.nome, this.nascimento, this.pathimg);
   //Sintaxe método
  String name()
    {
      return 'x';
    }

  int calcIdade(int idade){
    int i = idade;
    return i;
  }
  calcula()
  {
    idade = 5;
  }
 }