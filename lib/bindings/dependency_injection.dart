import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/controllers/home_controller.dart';
import 'package:todo_list/controllers/login_controller.dart';
import 'package:todo_list/controllers/splash_controller.dart';
import 'package:todo_list/infrastructure/models/istorage_repository.dart';
import 'package:todo_list/infrastructure/models/iuser_repository.dart';
import 'package:todo_list/infrastructure/repository/account_repository.dart';
import 'package:todo_list/infrastructure/repository/storage_repository.dart';
import 'package:todo_list/routes/router.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton(GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
  ));
  getIt.registerSingleton<AccountRepository>(FirebaseAccountRepo());
  getIt.registerSingleton<StorageRepository>(LocalStorageRepo());
  getIt.registerLazySingleton(() => SplashController(getIt.get(), getIt.get()));
  getIt.registerLazySingleton(() => LoginController(getIt.get()));
  getIt.registerLazySingleton(() => HomeController(getIt.get()));
}
