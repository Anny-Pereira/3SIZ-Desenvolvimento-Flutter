import 'package:appdio/domain/entities/product_entity.dart';
import 'package:appdio/domain/usecases/get_product_use_case.dart';
import 'package:flutter/widgets.dart';

class ProductController extends ChangeNotifier{

  final GetProductUseCase _getProductUseCase;
  List<ProductEntity> _products =[];
  bool isLoading = false;
  String? error;

  ProductController(this._getProductUseCase);

  //garante que só o controller acessa a lista
  List<ProductEntity> get products => _products;

//void pq não retorna nada, apenas notifica
  Future<void> fetchProducts() async{
    try {
      isLoading = true;
      _products = await _getProductUseCase.execute();
      error = null;
    } catch (e) {
      error = "Falha ao buscar produtos";
    } finally{
      //quando o bloco terminar executa:
      isLoading = false;
      notifyListeners();
    }
  }

}