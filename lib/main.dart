import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/bindings/dependency_injection.dart';
import 'package:todo_list/controllers/splash_controller.dart';
import 'package:todo_list/core/colors.dart';
import 'package:todo_list/core/dialog_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var router = GetIt.instance.get<GoRouter>();
    var splashController = getIt.get<SplashController>();

    return MaterialApp.router(
      scaffoldMessengerKey: DialogAPI.messengerKey,
      theme: theme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
