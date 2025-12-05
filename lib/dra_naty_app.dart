import 'package:flutter/material.dart';
import 'core/app_coordinator.dart';
import 'design/theme.dart';

class DraNatyApp extends StatelessWidget {
  final AppCoordinator coordinator;

  const DraNatyApp({super.key, required this.coordinator});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: coordinator.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: coordinator.startApp(),
    );
  }
}