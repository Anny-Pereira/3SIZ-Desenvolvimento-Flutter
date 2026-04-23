import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacetechapp/domain/mission_model.dart';
import 'package:spacetechapp/presentation/mission_view_model.dart';

class MissionCreateScreen extends StatefulWidget {
  const MissionCreateScreen({super.key});

  @override
  State<MissionCreateScreen> createState() => _MissionCreateScreenState();
}

class _MissionCreateScreenState extends State<MissionCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _launchDateController;
  late TextEditingController _statusController;

  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _launchDateController = TextEditingController();
    _statusController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _launchDateController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    final mission = MissionModel(
      id: 0,
      name: _nameController.text,
      launchDate: _launchDateController.text,
      status: _statusController.text,
    );

    final vm = context.read<MissionViewModel>();
    await vm.createMission(mission);

    setState(() {
      _isSubmitting = false;
      _errorMessage = null;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Missão')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Informe o nome.'
                    : null,
              ),
              TextFormField(
                controller: _launchDateController,
                decoration: const InputDecoration(
                  labelText: 'Data (YYYY-MM-DD)',
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Informe a data.'
                    : null,
              ),
              TextFormField(
                controller: _statusController,
                decoration: const InputDecoration(labelText: 'Status'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Informe o status.'
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isSubmitting
                    ? null
                    : () {
                        getData();
                      },
                child: _isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
