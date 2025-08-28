import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> votos = [];

  @override
  void initState() {
    // alimentando a lista
    votos.add({"nome": "Horta Comunitaria"});
    votos.add({"nome": "Biblioteca"});
    votos.add({"nome": "Parquinho"});
    votos.add({"nome": "Parquinho"});
    votos.add({"nome": "Parquinho"});

    super.initState();
  }

  Widget verificarVotos(String nome) {
    int contHorta = 0;
    int contBibli = 0;
    int contParq = 0;
    bool vencedor = false;

    if (nome == "Horta Comunitaria") {
      contHorta = contHorta + 1;
    } else if (nome == "Biblioteca") {
      contBibli = contBibli + 1;
    } else if (nome == "Parquinho") {
      contParq = contParq + 1;
    }

    if (contHorta > contBibli && contHorta > contParq) {
      vencedor = true;
    } else if (contBibli > contHorta && contBibli > contParq) {
       vencedor = true;
    } else if (contParq > contHorta && contParq > contBibli) {
       vencedor = true;
    } else {
      //return Text("$contHorta - $contBibli - $contParq --- $nome - Não Vencedor");
    }

    // if (contHorta > contBibli && contHorta > contParq) {
    //   return Text("Projeto $nome - Vencedor");
    // } else if (contBibli > contHorta && contBibli > contParq) {
    //   return Text("Projeto $nome - Vencedor");
    // } else if (contParq > contHorta && contParq > contBibli) {
    //   return Text("Projeto $nome - Vencedor");
    // } else {
    //   return Text("$contHorta - $contBibli - $contParq --- $nome - Não Vencedor");
    // }

    String resultado = vencedor  ? "Vencedor" : "Não Vencedor";
    return Text("Projeto: $nome - $resultado");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projetos Sociais do Bairro",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          for (var projeto in votos) 
            verificarVotos(projeto['nome']),
        ],
      ),
    );
  }
}
