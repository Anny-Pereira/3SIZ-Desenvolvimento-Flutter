import 'package:appstate/patient.dart';
import 'package:flutter/material.dart';

//CAMADA DE REGRAS DE NEGÓCIO
class HomeViewModel extends ChangeNotifier {
  final List<Patient> listPatients = [];

  void add(String name, String age) {
    final patient = Patient(name: name, age: int.parse(age));
    listPatients.add(patient);
    notifyListeners();
  }

  void remover(Patient patient) {
    listPatients.remove(patient);
    notifyListeners();
  }
}
