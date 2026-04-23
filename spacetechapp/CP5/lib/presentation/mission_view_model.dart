import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacetechapp/data/mission_repository.dart';
import 'package:spacetechapp/domain/mission_model.dart';

class MissionViewModel extends ChangeNotifier {
  final MissionRepository _repository;

  MissionViewModel(this._repository);

  List<MissionModel> _missions = [];
  bool _isLoading = false;
  String? _errorMessage;
  List<MissionModel> get missions => _missions;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadMissions() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _missions = await _repository.getMissions();
    } on DioException catch (e) {
      _errorMessage = 'Erro ao carregar missões: ${e.message}';
    } catch (e) {
      _errorMessage = 'Erro ao carregar missões: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createMission(MissionModel mission) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repository.createMission(mission);
    } on DioException catch (e) {
      _errorMessage = 'Erro ao cadastrar missão: ${e.message}';
    } catch (e) {
      _errorMessage = 'Erro ao cadastrar missão: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
