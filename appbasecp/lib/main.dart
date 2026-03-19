import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/http_client.dart';
import 'data/datasources/product_remote_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/get_product_usecase.dart';
import 'presentation/controllers/product_controller.dart';
import 'presentation/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instanciação das dependências
    final httpClient = CustomHttpClient();
    final productRemoteDatasource = ProductRemoteDatasource(httpClient);
    final productRepository = ProductRepositoryImpl(productRemoteDatasource);
    final getProductUseCase = GetProductUseCase(productRepository);
    final productController = ProductController(getProductUseCase);

    // Configuração do MultiProvider para gerenciamento de estado
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => productController),
      ],
      child: MaterialApp(
        title: 'Padrão de projeto Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ProductPage(),
      ),
    );
  }
}
