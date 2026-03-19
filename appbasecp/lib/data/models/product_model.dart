import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import '../../domain/entities/product_entity.dart';

// Model que representa o produto e faz a conversão do JSON
class ProductModel {
  final int id;
  final String title;
  final String price;
  ProductModel( {required this.id, required this.title, required this.price});

  // Cria um ProductModel a partir de um mapa JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
    );
  }

  //cria um JSON a partir de um ProductModel
  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'title': title,
      'price': price
    };
  }

  //Fabrica um ProductModel a partir de um ProductEntity (de dentro para fora)
  //Transforma em um model para usar na API
  factory ProductModel.fromProductEntity(
    ProductEntity productEntity
  ){
     return ProductModel(id: productEntity.id, title: productEntity.title, price: productEntity.price);
  }

    //Fabrica um ProductEntity a partir de um ProductModel (de fora para dentro)
    //Pega o que veio da API para usar ineternamente
  ProductEntity toProductEntity(){
    return ProductEntity(id: id, title: title, price: price);
  }
}
