import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // _ (underline)) na frente do nome da variavel indica que é privada e só pode ser usada dentro desse bloco
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  final GlobalKey _formKey = GlobalKey();
  String _name = "";
  String _age ="";

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  void Send(){
    //redesenha a tela passando os valores
    setState(() {
      _name = _nameController.text;
      _age = _ageController.text;
    });

    // final name = _nameController.text;
    // final age = _ageController.text;
    // print("name: $name - Idade: $age");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Sempre que tiver um campo de entrada de dado, tem uma Controller para "mandar" nele
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        label: Text("Digite o nome")
                      ),
                    ),
                    TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      label: Text("Digite a idade")
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    //tudo o que estiver aqui será executado
                    Send();
                  }, child: Text("Enviar"))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  Text("Nome: $_name"),
                  Text("Idade: $_age"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}