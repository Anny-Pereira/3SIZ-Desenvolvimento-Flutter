import 'package:appcp1/data/datasources/pacient_remote_datasource.dart';
import 'package:appcp1/domain/entities/pacient_entity.dart';
import 'package:appcp1/domain/repositories/pacient_repository.dart';

class PacientRepositoryImpl implements PacientRepository {
  final PacientRemoteDatasource datasource;

  PacientRepositoryImpl(this.datasource);

  @override
  Future<List<PacientEntity>> getPacients() async {
    return await datasource.getPacients();
  }
}
