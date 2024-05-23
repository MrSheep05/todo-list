import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/controllers/login_controller.dart';
import 'package:todo_list/controllers/splash_controller.dart';
import 'package:todo_list/routes/router.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton(GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,
  ));
  getIt.registerLazySingleton(() => SplashController());
  getIt.registerLazySingleton(() => LoginController());
}
