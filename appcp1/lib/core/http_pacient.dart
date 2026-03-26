import 'package:dio/dio.dart';

class CustomHttpPacient {
  final Dio dio;

  // Inicializa o client Dio
  CustomHttpPacient() : dio = Dio();

  Future<Response> getPacients() async {
    return await dio.get('https://gdapp.com.br/api/fiap/patients');
  }
}
