import 'package:appcp1/core/http_pacient.dart';
import 'package:appcp1/data/models/pacient_model.dart';
import 'package:appcp1/domain/entities/pacient_entity.dart';

class PacientRemoteDatasource {
  final CustomHttpPacient httpPacient;

  PacientRemoteDatasource(this.httpPacient);

  Future<List<PacientEntity>> getPacients() async {
    final response = await httpPacient.getPacients();

    final List<dynamic> dataList = response.data is List ? response.data : [];
    return dataList
        .map((e) => PacientModel.fromJson(e))
        .map((model) => model.toPacientEntity())
        .toList();
  }
}
