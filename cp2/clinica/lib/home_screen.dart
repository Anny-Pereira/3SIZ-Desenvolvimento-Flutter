import 'package:clinica/paciente.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _idadeController;
  late GlobalKey _form;
  final List<Paciente> listaPacientes = [];

  @override
  void initState() {
    _form = GlobalKey();
    _nameController = TextEditingController();
    _idadeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pré-Cadastro"),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      key: _form,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: Text("Informe o nome do paciente"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _idadeController,
                          decoration: InputDecoration(
                            label: Text("Informe a idade do paciente"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                final nome = _nameController.text;
                                final idade = _idadeController.text;
                                final paciente = Paciente(
                                  nome: nome,
                                  idade: int.parse(idade),
                                );
                                setState(() {
                                  listaPacientes.add(paciente);
                                });
                                _nameController.clear();
                                _idadeController.clear();
                              },
                              child: Text("Salvar"),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _nameController.clear();
                                _idadeController.clear();
                              },
                              child: Text("Limpar"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text("Pacientes"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listaPacientes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(listaPacientes[index].nome),
                          subtitle: Text(
                            "Idade: ${(listaPacientes[index].idade) < 18 ? "Menor" : listaPacientes[index].idade}",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
