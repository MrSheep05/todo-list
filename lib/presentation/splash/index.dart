import 'package:flutter/material.dart';
import 'package:todo_list/core/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/presentation/widgets/loading.dart';

GetIt getIt = GetIt.instance;

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Loading()],
      )),
    );
  }
}
