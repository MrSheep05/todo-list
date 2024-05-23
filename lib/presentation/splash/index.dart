import 'package:flutter/material.dart';
import 'package:todo_list/controllers/splash_controller.dart';
import 'package:todo_list/core/colors.dart';
import "package:todo_list/core/size.dart";
import 'package:get_it/get_it.dart';
import 'package:todo_list/presentation/widgets/loading.dart';

GetIt getIt = GetIt.instance;

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Loading()],
      )),
    );
  }
}
