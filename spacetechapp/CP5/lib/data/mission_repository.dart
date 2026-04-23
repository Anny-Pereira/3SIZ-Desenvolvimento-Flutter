import 'package:spacetechapp/data/mission_remote_service.dart';
import 'package:spacetechapp/domain/mission_model.dart';

abstract class MissionRepository {
  Future<List<MissionModel>> getMissions();
  Future<bool> createMission(MissionModel mission);
}

class MissionRepositoryImpl implements MissionRepository {
  MissionRepositoryImpl(this._remoteService);

  final MissionRemoteService _remoteService;

  @override
  Future<bool> createMission(mission) => _remoteService.createMission(mission);

  @override
  Future<List<MissionModel>> getMissions() => _remoteService.getMissions();
}
