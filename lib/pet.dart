

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

  int calcIdade(){
    final hoje = DateTime.now();
    idade = hoje.difference(nascimento).inDays;
    idade = (idade/365).round();
    
    return idade;
  }
  String dataNascFormatada()
  { 
    //sepsara a data em um vetor
    final dt = nascimento.toString().split(' ');
   //pega apenas a parte da data e descosidera a hora e separa em um novo vetor 
    //escreve o vetor de trás pra frente( dd/mm/aaaa) e junta novamente
    final d = dt[0].split('-').reversed.join('/');
    
    return d;
  }
 }