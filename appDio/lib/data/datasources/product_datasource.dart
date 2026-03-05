import 'package:appdio/core/http_client.dart';
import 'package:appdio/data/models/product_model.dart';
import 'package:appdio/domain/entities/product_entity.dart';

class ProductDatasource {
  final CustomHttpClient httpClient;

  ProductDatasource(this.httpClient);

  Future<List<ProductEntity>> getProducts() async{
    //response armazena o retorno da requisição
    final response = await httpClient.getProducts();

    return (response.data as List)
      .map((e) => ProductModel.fromJson(e)).toList();
  }

}