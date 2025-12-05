import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  String title = "Bem-vindo ao App Dra. Naty!";

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }
}