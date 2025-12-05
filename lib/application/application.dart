import 'package:flutter/material.dart';
import '../core/app_coordinator.dart';
import '../scenes/login/login_factory.dart';
import '../scenes/home/home_factory.dart';

class Application extends StatelessWidget {
  final AppCoordinator coordinator;

  const Application({super.key, required this.coordinator});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DRA.NATY",
      navigatorKey: coordinator.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9FBF9),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA5E3B5)),
        useMaterial3: true,
      ),

      // 🔥 Tela inicial do app
      // Use factories so providers are injected
      home: LoginFactory.make(coordinator: coordinator),
      routes: {
        "/home": (_) => HomeFactory.make(coordinator: coordinator),
      },
    );
  }
}