import 'package:appdio/core/http_client.dart';
import 'package:appdio/data/datasources/product_datasource.dart';
import 'package:appdio/data/repositories/product_repository_impl.dart';
import 'package:appdio/domain/repositories/product_repository.dart';
import 'package:appdio/domain/usecases/get_product_use_case.dart';
import 'package:appdio/presentation/controllers/product_controller.dart';
import 'package:appdio/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

     final httpClient = CustomHttpClient();
     final productDataSource = ProductDatasource(httpClient);
     final productRepository = ProductRepositoryImpl(productDataSource);
     final getProductUseCase = GetProductUseCase(productRepository);


    return MultiProvider(
      //define camadas
      providers: [
        ChangeNotifierProvider(create:  (_)=> ProductController(getProductUseCase))
      ],
      child: MaterialApp(
        title: 'Consumo de API Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ProductPage(),
      ),
    );
  }
}
