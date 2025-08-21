import 'package:flutter/material.dart';
import 'package:myotherapp/domain/person.dart';
import 'package:myotherapp/domain/student.dart';
import 'package:myotherapp/domain/teacher.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //sera chamado mais tarde
  late Person person;
  late Teacher teacher;
  late Student student;
  
  @override
  void initState() {
  person = Person(name: "Juca", age: 18, height: 1.70);
  teacher = Teacher(name: "Sofia", age: 30, height: 1.60);
  student = Student(name: "Tonhao", age: 20, height: 2.00);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //renedrizar uma estrutura de tela
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        //faz alinhamento dos elementos
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informações da pessoa", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(person.presenter()),
          Text("Informações do professor", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(teacher.presenter()),
          Text("Informações do aluno", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(student.presenter()),
        ],
      ),
    );
  }
}