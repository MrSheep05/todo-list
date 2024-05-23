import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, brightness: Brightness.light),
  primaryColor: const Color(0xF6F6F6FF),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    },
  ),
);
