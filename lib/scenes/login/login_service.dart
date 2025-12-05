class LoginService {
  Future<bool> login(String email, String senha) async {
    await Future.delayed(const Duration(milliseconds: 600)); // simula requisição

    // Simulação simples: Sucesso apenas com estas credenciais
    if (email == "teste@gmail.com" && senha == "123") {
      return true;
    }

    return false;
  }
}