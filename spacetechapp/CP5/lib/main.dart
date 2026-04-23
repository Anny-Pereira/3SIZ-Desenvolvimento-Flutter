import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacetechapp/core/dependency_injection.dart';
import 'package:spacetechapp/presentation/mission_view_model.dart';

import 'presentation/mission_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependecyInjection();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MissionViewModel(getIt())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio 1 - SpaceTech',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const MissionListScreen(),
    );
  }
}
