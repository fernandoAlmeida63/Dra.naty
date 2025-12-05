import 'package:flutter_test/flutter_test.dart';
import 'package:dra_naty/scenes/login/login_view_model.dart';
import 'package:dra_naty/scenes/login/login_service.dart';
import 'package:dra_naty/core/app_coordinator.dart';

class FakeLoginService implements LoginService {
  final bool result;
  FakeLoginService(this.result);

  @override
  Future<bool> login(String emailOrCpf, String password) async {
    // Simula pequena latência
    await Future.delayed(const Duration(milliseconds: 10));
    return result;
  }
}

class TestCoordinator extends AppCoordinator {
  bool wentToHome = false;
  bool wentToRegister = false;

  @override
  void goToHome() {
    wentToHome = true;
  }

  @override
  void goToRegister() {
    wentToRegister = true;
  }
}

void main() {
  test('login success navigates to home', () async {
    final coordinator = TestCoordinator();
    final service = FakeLoginService(true);
    final vm = LoginViewModel(coordinator: coordinator, loginService: service);

    vm.updateEmail('user@example.com');
    vm.updatePassword('password');

    await vm.login();

    expect(vm.isLoading, isFalse);
    expect(vm.loginFailed, isFalse);
    expect(coordinator.wentToHome, isTrue);
  });

  test('login failure sets loginFailed and does not navigate', () async {
    final coordinator = TestCoordinator();
    final service = FakeLoginService(false);
    final vm = LoginViewModel(coordinator: coordinator, loginService: service);

    vm.updateEmail('user@example.com');
    vm.updatePassword('wrong');

    await vm.login();

    expect(vm.isLoading, isFalse);
    expect(vm.loginFailed, isTrue);
    expect(coordinator.wentToHome, isFalse);
  });
}
