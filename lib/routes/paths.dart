import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class Paths {
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SPLASH = '/';
  static const String REGISTER = '/register';
  static const String ADD_TASK = '/add_task';
}

void navigate(String path) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) => GetIt.instance.get<GoRouter>().go(path));
}
