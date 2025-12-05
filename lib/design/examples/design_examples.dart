import 'package:flutter/material.dart';
import '../components/primary_button.dart';
import '../components/ds_text_field.dart';

/// Pequeno conjunto de exemplos de uso dos componentes do Design System.
class DesignExamplesPage extends StatelessWidget {
  const DesignExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Design System — Exemplos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Campos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            DsTextField(controller: emailCtrl, hintText: 'Email'),
            const SizedBox(height: 8),
            DsTextField(controller: passCtrl, hintText: 'Senha', obscureText: true),
            const SizedBox(height: 20),
            const Text('Botões', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            PrimaryButton(
              onPressed: () {},
              child: const Text('Primário'),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              onPressed: null,
              child: const Text('Desabilitado'),
            ),
          ],
        ),
      ),
    );
  }
}
