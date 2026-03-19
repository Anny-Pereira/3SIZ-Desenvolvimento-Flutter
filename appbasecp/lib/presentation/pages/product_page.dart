import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';

// Página que exibe a lista de produtos
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    final controller = context.read<ProductController>();
    // Busca produtos ao abrir a página
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: Builder(
        builder: (_) {
          // Exibe indicador de carregamento
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Exibe mensagem de erro
          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          // Exibe lista de produtos
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              final product = controller.products[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text('Preço: R\$ ${product.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
