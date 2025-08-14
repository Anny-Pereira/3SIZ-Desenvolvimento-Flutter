import 'package:flutter/material.dart';

void main() {
  //-------Definição de variáveis

  String name = "Anny"; 
  int age = 20;
  double height = 1.60;
  var city = "São Paulo"; //inferência de tipo
  dynamic qualquerCoisa = "Vila Mariana";

  print("Nome: $name, Idade: $age, Altura: $height, Cidade: $city, Bairro: $qualquerCoisa");


  //Condicionais
  if (age >= 18) {
    print("Maior de idade");
  } else{
    print("Menor de idade");
  }


  switch (city) {
    case "São Paulo":
      print("Grande cidade");
      break;
    case "Ilhéus":
      print("Cidade pequena");
    default:
      print("Cidade desconhecida");
  }
  

  //Laços de repetição
  for (var i = 0; i < 3; i++) {
    print("Indice: $i");
  }

  int i = 0;
  while (i < 3 ) {
    print("Indice: $i");
    i++;
  }

  int j = 0;
  do {
    print("Indice: $j");
    j++;
  } while (j<3);



  //Listas 
  


}

