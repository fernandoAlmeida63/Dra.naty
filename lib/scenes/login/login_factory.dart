import 'login_view.dart';
import 'login_view_model.dart';
import '../../core/app_coordinator.dart';
import 'login_service.dart';

class LoginFactory {
  static LoginView make({required AppCoordinator coordinator}) {
    // 1. Cria a instância do serviço
    final service = LoginService(); 
    
    // 2. Injeta o serviço no ViewModel
    final vm = LoginViewModel(
      coordinator: coordinator,
      loginService: service, 
    );
    return LoginView(viewModel: vm);
  }
}