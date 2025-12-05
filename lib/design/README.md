# Design System — Dra.naty

Este diretório contém os artefatos iniciais do Design System do projeto Dra.naty: tokens, tema e componentes reutilizáveis mínimos.

Objetivos:
- Garantir consistência visual (cores, tipografia, espaçamento).
- Fornecer componentes atômicos reutilizáveis para acelerar desenvolvimento.
- Servir de base para documentação e testes visuais.

Estrutura atual:
- `tokens.dart` — cores, tipografia e espaçamentos (fonte de verdade dos valores de UI).
- `theme.dart` — `AppTheme` com `ThemeData` (light/dark).
- `components/primary_button.dart` — `PrimaryButton` (botão padrão do DS).
- `components/ds_text_field.dart` — `DsTextField` (campo de texto estilizado).

Como usar

1. Importar o tema no `MaterialApp` (já aplicado em `lib/dra_naty_app.dart`):

```dart
import 'design/theme.dart';

MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,
  // ...
)
```

2. Usar componentes nas suas views:

```dart
import 'package:flutter/material.dart';
import 'design/components/primary_button.dart';
import 'design/components/ds_text_field.dart';

class LoginSample extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DsTextField(hintText: 'Email', controller: emailController),
          const SizedBox(height: 12),
          DsTextField(hintText: 'Senha', obscureText: true),
          const SizedBox(height: 20),
          PrimaryButton(
            onPressed: () {
              // ação de login
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
```

Boas práticas
- Sempre consumir tokens via `AppColors`, `AppTextStyles` e `AppSpacing` em vez de valores "hardcoded".
- Componentes devem ser pequenos e composáveis; crie variações (small, large) quando necessário.
- Documente estados (normal, hover, disabled, error) e adicione golden tests para prevenir regressões visuais.
