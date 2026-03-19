import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

// Implementação do repositório de produtos
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource datasource;

  // Recebe o datasource via construtor
  ProductRepositoryImpl(this.datasource);

  // Obtém produtos do datasource
  @override
  Future<List<ProductEntity>> getProducts() async {
    return await datasource.getProducts();
  }
  
  @override
  Future<bool> createProduct(ProductEntity product) async{
    return await datasource.createProduct(product);
  }
}
