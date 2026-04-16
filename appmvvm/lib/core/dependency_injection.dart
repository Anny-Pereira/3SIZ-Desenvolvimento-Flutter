

import 'dart:io';

import 'package:appmvvm/core/http_client.dart';
import 'package:appmvvm/data/mission_remote_service.dart';
import 'package:appmvvm/data/mission_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependecyInjection() async{
  //inicia tardiamente pq é um serviço pesado
  getIt.registerLazySingleton<CustomHttpClient>(CustomHttpClient.new);
  getIt.registerLazySingleton<MissionRemoteService>(()=>MissionRemoteService(getIt()));
  getIt.registerLazySingleton<MissionRepository>(()=>MissionRepositoryImpl(getIt()));
}