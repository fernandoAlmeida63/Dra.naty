import 'package:flutter/material.dart';
import '../scenes/login/login_factory.dart';
import '../scenes/home/home_factory.dart';

class AppCoordinator {
  final navigatorKey = GlobalKey<NavigatorState>();

  Widget startApp() {
    return LoginFactory.make(coordinator: this);
  }
  
  void goToHome() {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => HomeFactory.make(coordinator: this)),
    );
  }

  void goToLogin() {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => LoginFactory.make(coordinator: this)),
    );
  }

  void goToRegister() {
    // Em breve você cria a tela
  }
}