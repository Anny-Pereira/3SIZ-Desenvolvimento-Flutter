import 'package:appcp1/presentation/controllers/upa_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpaHomeScreen extends StatefulWidget {
  const UpaHomeScreen({super.key});

  @override
  State<UpaHomeScreen> createState() => _UpaHomeScreenState();
}

class _UpaHomeScreenState extends State<UpaHomeScreen> {
  @override
  void initState() {
    super.initState();
    final controller = context.read<UpaHomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchPacients();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UpaHomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('UPA - Pacientes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchPacients,
          ),
        ],
      ),
      // Exibe loading, erro ou a lista conforme o estado atual
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
          //Exibe a mensagem de error caso a requisição falhe
          ? Center(child: Text(controller.error!))
          //Exibe a lista de pacientes quando os dados estão disponíveis
          : ListView.builder(
              itemCount: controller.pacients.length,
              itemBuilder: (context, index) {
                final patient = controller.pacients[index];

                return ListTile(
                  leading: CircleAvatar(child: Text('${patient.id}')),
                  title: Text(patient.nome),
                  subtitle: Text('Idade: ${patient.idade} anos'),
                  trailing: Text(patient.status),
                );
              },
            ),
    );
  }
}
