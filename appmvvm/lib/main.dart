import 'package:appmvvm/core/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/mission_list_screen.dart';
import 'presentation/mission_view_model.dart';

Future<void> main() async {

  //injeção de dependência
  WidgetsFlutterBinding.ensureInitialized(); 
  //levanta e garante que está tudo certo para a aplicação (tela branca)
  //injeta tudo o que o aplicativo precisa
  await setupDependecyInjection();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MissionViewModel(getIt()),
        ),
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
      title: 'NASA - Missões',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MissionListScreen(),
    );
  }
}
