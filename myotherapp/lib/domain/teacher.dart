import 'package:myotherapp/domain/person.dart';

class Teacher extends Person {
  //super - atributo classe pai
  Teacher({
    required super.name,
    required super.age,
    required super.height
  });

  String teach(){
    return "$name está ensinando Flutter";
  }

}