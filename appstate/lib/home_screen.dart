import 'package:appstate/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//CAMADA DE APRESENTAÇÃO (TELA)
class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  //permite a chamada pra View_Model
  @override
  void didChangeDependencies() {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Informe o nome"),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: "Informe a idade"),
                ),
              ),
              Container(
                height: 50.0, // Define a altura do container
                width: 150.0, // Define a largura do container
                child: ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text;
                    final age = _ageController.text;
                    _homeViewModel.add(name, age);
                  },
                  child: Text("Salvar"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
