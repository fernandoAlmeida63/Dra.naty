import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';
import 'home_view_model.dart';
import '../../core/app_coordinator.dart';

class HomeFactory {
  static Widget make({required AppCoordinator coordinator}) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      // CORREÇÃO: HomeView agora é a tela completa
      child: HomeView( 
        onLogout: () {
          coordinator.goToLogin(); // Lógica para voltar ao login
        },
      ),
    );
  }
}