import 'package:appcp1/domain/entities/pacient_entity.dart';

abstract class PacientRepository {
  Future<List<PacientEntity>> getPacients();
}
