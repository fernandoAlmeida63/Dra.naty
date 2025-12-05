import 'package:flutter/material.dart';
import 'core/app_coordinator.dart';
import 'dra_naty_app.dart';

void main() {
  final coordinator = AppCoordinator();
  runApp(DraNatyApp(coordinator: coordinator));
}
