import 'package:get_it/get_it.dart';
import 'package:practical/repository/auth_repository.dart';
import 'package:practical/repository/services_repository.dart';
import 'package:practical/service/navigation_service.dart';
import 'package:practical/service/network_servce.dart';
import 'package:practical/view_model/auth/auth_view_model.dart';
import 'package:practical/view_model/auth/i_auth_view_model.dart';
import 'package:practical/view_model/services/i_services_view_model.dart';
import 'package:practical/view_model/services/services_view_model.dart';


import 'delegate/auth_delegate.dart';
import 'delegate/services_delegate.dart';
import 'service/error_services.dart';

final sl = GetIt.instance;
void init() {
  sl.registerFactory<AuthScreenViewModel>(
    () => IAuthScreenViewModel(
      authRepository: sl(),
      navigationService: sl(),
      errorService: sl(),
    ),
  );
  sl.registerFactory<ServicesScreenViewModel>(
    () => IServicesViewModel(
      servicesRepository: sl(),
      navigationService: sl(),
      errorService: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthDelegate(
      networkService: sl(),
      errorService: sl(),
      navigationService: sl(),
    ),
  );
  sl.registerLazySingleton<ServicesRepository>(
    () => ServicesDelegate(
      networkService: sl(),
      errorService: sl(),
    ),
  );
  sl.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );

  sl.registerLazySingleton<ErrrorService>(
    () => ErrrorService(
      sl(),
    ),
  );
  sl.registerLazySingleton<NetworkService>(
    () => NetworkService(),
    dispose: (c) => c.dispose(),
  );
}
