import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dra_naty/application/application.dart';
import 'package:dra_naty/core/app_coordinator.dart';

void main() {
  testWidgets('Login view should load', (WidgetTester tester) async {
    final coordinator = AppCoordinator();

    await tester.pumpWidget(
      Application(coordinator: coordinator),
    );

    // Verifica que a tela de login carregou
    expect(find.text('Bem-vindo de volta'), findsOneWidget);

    // Verifica que o botão Entrar existe
    expect(find.text('Entrar'), findsOneWidget);

    // Verifica que o campo de email existe
    expect(find.byType(TextField), findsNWidgets(2));
  });
}
