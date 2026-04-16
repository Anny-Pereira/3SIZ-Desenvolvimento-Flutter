import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../data/mission_repository.dart';
import '../domain/mission_model.dart';

/// ViewModel responsável por gerenciar o estado da lista de missões.
class MissionViewModel extends ChangeNotifier {
  final MissionRepository _repository;

  MissionViewModel(this._repository);

  // Lista interna de missões
  List<MissionModel> _missions = [];

  // Indicador de carregamento
  bool _isLoading = false;

  // Mensagem de erro, se houver
  String? _errorMessage;

  /// Retorna a lista atual de missões.
  List<MissionModel> get missions => _missions;

  /// Retorna [true] se os dados estiverem sendo carregados.
  bool get isLoading => _isLoading;

  /// Retorna a mensagem de erro atual ou [null] se não houver erro.
  String? get errorMessage => _errorMessage;

  /// Carrega as missões da fonte de dados e atualiza o estado.
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

  Future<void> createMission(MissionModel mission) async{
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