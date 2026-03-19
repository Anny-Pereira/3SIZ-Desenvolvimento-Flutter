import 'package:flutter/cupertino.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_usecase.dart';

// Controller responsável por gerenciar o estado dos produtos
class ProductController extends ChangeNotifier {
  final GetProductUseCase _getProductUseCase;
  List<ProductEntity> _products = [];
  bool isLoading = false;
  String? error;

  // Getter para acessar os produtos
  List<ProductEntity> get products => _products;

  // Recebe o caso de uso via construtor
  ProductController(this._getProductUseCase);

  // Busca produtos e atualiza o estado
  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      _products = await _getProductUseCase.execute();

      error = null;
      notifyListeners();
    } catch (e) {
      error = "Error ao carregar os produtos";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
