import 'package:get_it/get_it.dart';
import 'package:spacetechapp/core/http_client.dart';
import 'package:spacetechapp/data/mission_remote_service.dart';
import 'package:spacetechapp/data/mission_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependecyInjection() async {
  getIt.registerLazySingleton<CustomHttpClient>(CustomHttpClient.new);
  getIt.registerLazySingleton<MissionRemoteService>(
    () => MissionRemoteService(getIt()),
  );
  getIt.registerLazySingleton<MissionRepository>(
    () => MissionRepositoryImpl(getIt()),
  );
}
