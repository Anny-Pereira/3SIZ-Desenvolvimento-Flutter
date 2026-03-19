import '../../core/http_client.dart';

import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

// Classe responsável por acessar dados de produtos de uma fonte remota (API)
class ProductRemoteDatasource {
  final CustomHttpClient httpClient;

  // Recebe o client HTTP via construtor (injeção de dependência)
  ProductRemoteDatasource(this.httpClient);

  // Busca produtos na API, converte o JSON para o modelo e retorna uma lista de entidades
  Future<List<ProductEntity>> getProducts() async {
    final response = await httpClient.getProducts(); // Chama o método do client para obter os dados

    // Converte a resposta da API em uma lista de ProductEntity usando o model
    final List<dynamic> dataList = response.data is List ? response.data : [];
    return dataList
        .map((e) => ProductModel.fromJson(e))
        .map((model)=> model.toProductEntity())
        .toList();
  }

  //método para cadastrar um produto
  Future<bool> createProduct(ProductEntity product) async{
    try {
      final model = ProductModel.fromProductEntity(product);
      await httpClient.createProduct(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
