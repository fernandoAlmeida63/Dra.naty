import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginView({super.key, required this.viewModel});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  double opacity = 0;
  double offsetY = -0.1; // pequeno deslize para baixo

  @override
  void initState() {
    super.initState();

    // inicia animação após 100ms
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1;
        offsetY = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.viewModel,
      child: Consumer<LoginViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF9FBF9),
            body: SingleChildScrollView( 
              child: Column(
                children: [

                  // ================= HEADER =================
                  Padding(
                    padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Ação de voltar (pop)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                            },
                            child: const SizedBox(
                              height: 48,
                              width: 48,
                              child: Icon(Icons.arrow_back,
                                  size: 26, color: Color(0xFF101912)),
                            ),
                          ),
                        ),

                        // LOGO com animação
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut,
                          opacity: opacity,
                          child: AnimatedSlide(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOut,
                            offset: Offset(0, offsetY),
                            child: SizedBox(
                              height: 90, 
                              child: Image.asset(
                                "assets/logo.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ================= TÍTULO =================
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Bem-vindo de volta",
                      style: TextStyle(
                        color: Color(0xFF101912),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  // Mensagem de erro de login
                  if (vm.loginFailed) 
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 16, right: 16),
                      child: Text(
                        "Credenciais inválidas. Tente novamente.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                  // ================= EMAIL CPF =================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: TextField(
                      onChanged: vm.updateEmail,
                      decoration: InputDecoration(
                        hintText: "E-mail ou CPF",
                        hintStyle: const TextStyle(color: Color(0xFF5B8B67)),
                        filled: true,
                        fillColor: const Color(0xFFE9F1EB),
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Color(0xFF101912)),
                    ),
                  ),

                  // ================= SENHA =================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: TextField(
                      onChanged: vm.updatePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        hintStyle: const TextStyle(color: Color(0xFF5B8B67)),
                        filled: true,
                        fillColor: const Color(0xFFE9F1EB),
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Color(0xFF101912)),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          color: Color(0xFF5B8B67),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ================= BOTÃO ENTRAR =================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: vm.isLoading ? const Color(0xFFBFE5C8) : const Color(0xFFA5E3B5),
                          foregroundColor: const Color(0xFF101912),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // Desabilita e mostra o carregamento
                        onPressed: vm.isLoading ? null : vm.login,
                        child: vm.isLoading
                            ? const Center(child: SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Color(0xFF101912), 
                                  strokeWidth: 3,
                                ),
                              ))
                            : const Text("Entrar"),
                      ),
                    ),
                  ),

                  // ================= BOTÃO CRIAR CONTA =================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE9F1EB),
                          foregroundColor: const Color(0xFF101912),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: vm.isLoading ? null : vm.goToRegister,
                        child: const Text("Criar nova conta"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}