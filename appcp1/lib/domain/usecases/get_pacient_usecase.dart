import 'package:appcp1/domain/entities/pacient_entity.dart';
import 'package:appcp1/domain/repositories/pacient_repository.dart';

class GetPacientUsecase {
  final PacientRepository pacientRepository;

  GetPacientUsecase(this.pacientRepository);

  Future<List<PacientEntity>> execute() async {
    return await pacientRepository.getPacients();
  }
}
