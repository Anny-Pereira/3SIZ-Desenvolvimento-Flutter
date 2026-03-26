import 'package:appcp1/domain/entities/pacient_entity.dart';

class PacientModel {
  final int id;
  final String nome;
  final String idade;
  final String status;
  PacientModel({
    required this.id,
    required this.nome,
    required this.idade,
    required this.status,
  });

  factory PacientModel.fromJson(Map<String, dynamic> json) {
    return PacientModel(
      id: json['id'],
      nome: json['name'],
      idade: json['age'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'idade': idade, 'status': status};
  }

  factory PacientModel.fromPacientEntity(PacientEntity pacientEntity) {
    return PacientModel(
      id: pacientEntity.id,
      nome: pacientEntity.nome,
      idade: pacientEntity.idade,
      status: pacientEntity.status,
    );
  }

  PacientEntity toPacientEntity() {
    return PacientEntity(id: id, nome: nome, idade: idade, status: status);
  }
}
