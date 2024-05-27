import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/add_task/index.dart';
import 'package:todo_list/presentation/home/index.dart';
import 'package:todo_list/presentation/login/index.dart';
import 'package:todo_list/presentation/register/index.dart';
import 'package:todo_list/presentation/splash/index.dart';
import 'package:todo_list/routes/paths.dart';

part 'router.g.dart';

@TypedGoRoute<HomeRoute>(path: Paths.HOME)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<LoginRoute>(path: Paths.LOGIN)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<SplashRoute>(path: Paths.SPLASH)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<RegisterRoute>(path: Paths.REGISTER)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const RegisterPage();
}

@TypedGoRoute<AddTaskRoute>(path: Paths.ADD_TASK)
class AddTaskRoute extends GoRouteData {
  const AddTaskRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const AddTaskPage();
}
