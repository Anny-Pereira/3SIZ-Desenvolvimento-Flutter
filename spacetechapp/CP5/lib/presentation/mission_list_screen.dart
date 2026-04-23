import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacetechapp/presentation/mission_view_model.dart';

import 'mission_create_screen.dart';

class MissionListScreen extends StatefulWidget {
  const MissionListScreen({super.key});

  @override
  State<MissionListScreen> createState() => _MissionListScreenState();
}

class _MissionListScreenState extends State<MissionListScreen> {
  late MissionViewModel _missionViewModel;

  @override
  void initState() {
    //tudo desse bloco só deve ser chamado depois que a tela for recomposta
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _missionViewModel = context.read<MissionViewModel>();
      _missionViewModel.loadMissions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MissionViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('SpaceTech - Missões')),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.errorMessage != null
          ? Center(child: Text(vm.errorMessage!))
          : RefreshIndicator(
              onRefresh: vm.loadMissions,
              child: ListView.builder(
                itemCount: vm.missions.length,
                itemBuilder: (_, index) {
                  final mission = vm.missions[index];
                  return ListTile(
                    title: Text(mission.name),
                    subtitle: Text(
                      'Lançamento: ${mission.launchDate} · ${mission.status}',
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const MissionCreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
