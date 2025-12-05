import 'package:flutter/material.dart';
import '../../core/app_coordinator.dart';
import 'login_service.dart'; 
 
class LoginViewModel extends ChangeNotifier {
  final AppCoordinator coordinator;
  final LoginService loginService; // Adicionado
 
  String emailOrCpf = "";
  String password = "";
  bool isLoading = false; // Estado de carregamento
  bool loginFailed = false; // Estado de falha
 
  LoginViewModel({required this.coordinator, required this.loginService});
 
  void updateEmail(String value) {
    emailOrCpf = value;
    loginFailed = false;
    notifyListeners();
  }
 
  void updatePassword(String value) {
    password = value;
    loginFailed = false;
    notifyListeners();
  }
 
  Future<void> login() async {
    if (emailOrCpf.isEmpty || password.isEmpty || isLoading) {
      return;
    }
    
    isLoading = true;
    loginFailed = false;
    notifyListeners();
 
    final success = await loginService.login(emailOrCpf, password);
 
    isLoading = false;
 
    if (success) {
      coordinator.goToHome();
    } else {
      loginFailed = true; // Define a falha para mostrar mensagem de erro
    }
    notifyListeners();
  }
 
  void goToRegister() {
    coordinator.goToRegister();
  }
}