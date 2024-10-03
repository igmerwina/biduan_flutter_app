import 'package:dio/dio.dart';
import 'package:doctor_booking_app/feature/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:doctor_booking_app/data/base_url.dart';
import 'package:doctor_booking_app/data/dio.dart';
import 'package:doctor_booking_app/data/app_preferences.dart';
import 'package:doctor_booking_app/data/app_repository.dart';
import 'package:doctor_booking_app/feature/register/bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
const instanceDefaultDio = "default";

void init() async {
  getIt.registerLazySingleton<Dio>(
    () => configureDio(baseUrl),
    instanceName: instanceDefaultDio,
  );

  getIt.registerLazySingleton(() => Logger());

  dataInjection();
  initBloc();
}

void dataInjection() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  getIt.registerLazySingleton<AppRepository>(
    () => AppRepository(
      dio: getIt.get<Dio>(instanceName: instanceDefaultDio),
      pref: getIt.get<AppPreferences>(),
      log: getIt.get<Logger>(),
    ),
  );

  getIt.registerLazySingleton<AppPreferences>(
    () => AppPreferences(preferences: getIt.get<SharedPreferences>()),
  );
}

void initBloc() {
  getIt.registerLazySingleton<RegisterBloc>(
    () => RegisterBloc(
      appRepository: getIt.get<AppRepository>(),
      log: getIt.get<Logger>(),
    ),
  );

  getIt.registerLazySingleton<LoginBloc>(
    () => LoginBloc(
      appRepository: getIt.get<AppRepository>(),
      pref: getIt.get<AppPreferences>(),
      log: getIt.get<Logger>(),
    ),
  );
}
