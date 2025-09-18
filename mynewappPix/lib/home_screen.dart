import 'package:flutter/material.dart';
import 'package:mynewapp/custom_input_widget.dart';
import 'package:mynewapp/custom_select_cities.dart';
import 'package:mynewapp/custom_select_types.dart';
import 'package:mynewapp/explorer.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _chavePixController;
  late TextEditingController _valorController;
  late TextEditingController _cidadeController;
  late TextEditingController _tipoChaveController;

  late GlobalKey _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    _chavePixController = TextEditingController();
    _valorController = TextEditingController();
    _cidadeController = TextEditingController();
    _tipoChaveController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _chavePixController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Formulário"),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      key: _formKey,
                      children: [
                        CustomInputWidget(
                          label: 'Informe o tipo chave pix',
                          controller: _tipoChaveController,
                        ),
                        CustomInputWidget(
                          label: 'Informe a chave pix',
                          controller: _chavePixController,
                        ),
                        CustomInputWidget(
                          label: 'Informe a cidade',
                          controller: _cidadeController,
                        ),
                        CustomInputWidget(
                          label: 'Informe o valor',
                          controller: _valorController,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Salvar")),
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
              color: Colors.yellow,
              child: Column(
                children: [
                  Text("Exploradores"),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
