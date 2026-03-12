import 'package:appdio/domain/entities/product_entity.dart';
import 'package:appdio/domain/repositories/product_repository.dart';

class GetProductUseCase {
  final ProductRepository productRepository;

  GetProductUseCase(this.productRepository);

  Future<List<ProductEntity>> execute()async{
    return productRepository.getProducts();
  }

}