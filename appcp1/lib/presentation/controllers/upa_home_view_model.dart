import 'package:appcp1/domain/entities/pacient_entity.dart';
import 'package:appcp1/domain/usecases/get_pacient_usecase.dart';
import 'package:flutter/material.dart';

class UpaHomeViewModel extends ChangeNotifier {
  final GetPacientUsecase _getPacientUseCase;
  List<PacientEntity> _pacients = [];
  bool isLoading = false;
  String? error;

  List<PacientEntity> get pacients => _pacients;

  UpaHomeViewModel(this._getPacientUseCase);

  Future<void> fetchPacients() async {
    try {
      isLoading = true;
      notifyListeners();

      _pacients = await _getPacientUseCase.execute();

      error = null;
      notifyListeners();
    } catch (e) {
      error = "Error ao carregar os pacientes";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
