import 'package:appcp1/core/http_pacient.dart';
import 'package:appcp1/data/datasources/pacient_remote_datasource.dart';
import 'package:appcp1/data/repositories/pacient_repository_impl.dart';
import 'package:appcp1/domain/usecases/get_pacient_usecase.dart';
import 'package:appcp1/presentation/controllers/upa_home_view_model.dart';
import 'package:appcp1/presentation/pages/upa_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final httpPacient = CustomHttpPacient();
    final pacientRemoteDatasource = PacientRemoteDatasource(httpPacient);
    final pacientRepository = PacientRepositoryImpl(pacientRemoteDatasource);
    final getPacientUseCase = GetPacientUsecase(pacientRepository);
    final upaHomeViewModel = UpaHomeViewModel(getPacientUseCase);

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => upaHomeViewModel)],
      child: MaterialApp(
        title: 'UPA - Gestão de Pacientes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const UpaHomeScreen(),
      ),
    );
  }
}
