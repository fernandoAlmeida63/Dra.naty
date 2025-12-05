import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../design/components/primary_button.dart';
import '../design/components/ds_text_field.dart';

void main() => runApp(const StorybookApp());

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dra.naty Storybook',
      theme: ThemeData.light(),
      home: Storybook(
        children: [
          Story(
            name: 'PrimaryButton/Default',
            builder: (_, k) => Center(
              child: PrimaryButton(
                onPressed: () {},
                child: Text(k.text(label: 'label', initial: 'Entrar')),
              ),
            ),
          ),
          Story(
            name: 'PrimaryButton/Disabled',
            builder: (_, k) => Center(
              child: PrimaryButton(
                onPressed: null,
                child: Text(k.text(label: 'label', initial: 'Entrar')),
              ),
            ),
          ),
          Story(
            name: 'DsTextField/Default',
            builder: (_, k) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: DsTextField(
                hintText: k.text(label: 'hint', initial: 'Digite aqui'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
