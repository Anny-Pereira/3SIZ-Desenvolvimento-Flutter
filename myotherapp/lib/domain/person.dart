class Person {
  String name;
  int age;
  double height;

  Person({
    required this.name, 
    required this.age, 
    required this.height
  });

  //apresentação
  String presenter(){
    return "Meu nome é: $name\nMinha idade é: $age\nMinha altura é: $height";
  }

}