import 'package:firebaseapp/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  AuthRepository _authRepository;

  RegistrationViewModel(this._authRepository);

  Future<void> register() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authRepository.signUp("anny@gmail.com", "123456");
      debugPrint("Usuario cadastrado");
    } catch (e) {
      debugPrint("Falha ao cadastrar: $e");
      rethrow; //retorna com exceção
    } finally{
      _isLoading = false;
      notifyListeners();
    }

    // Simulação de registro
    // await Future.delayed(const Duration(seconds: 2));
    // print('Registro realizado para $name ($email)');

    // _isLoading = false;
    // notifyListeners();
  }
}
