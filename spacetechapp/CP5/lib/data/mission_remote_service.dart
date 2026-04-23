import 'package:spacetechapp/core/http_client.dart';
import 'package:spacetechapp/domain/mission_model.dart';

class MissionRemoteService {
  MissionRemoteService(this._httpClient);

  final CustomHttpClient _httpClient;

  Future<List<MissionModel>> getMissions() async {
    final response = await _httpClient.get('/missions');
    final list = response.data as List<dynamic>;
    return list.map((e) => MissionModel.fromJson(e)).toList();
  }

  Future<bool> createMission(MissionModel mission) async {
    await _httpClient.post('/missions', data: mission.toJson());
    return true;
  }
}
