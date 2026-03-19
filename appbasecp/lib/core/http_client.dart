import 'package:dio/dio.dart';

// Classe responsável por requisições HTTP usando Dio
class CustomHttpClient {
  final Dio dio;

  // Inicializa o client Dio
  CustomHttpClient() : dio = Dio();

  // Realiza requisição GET para buscar produtos
  Future<Response> getProducts() async {
    return await dio.get('https://gdapp.com.br/api/fiap/products');
  }

  Future<Response> createProduct(Map<String, dynamic> data) async {
    return await dio.get('https://gdapp.com.br/api/fiap/products', data: data);
  }
}
