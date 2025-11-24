import 'package:flutter/material.dart';
import '../widgets/converter_form.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Converter"), centerTitle: true),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ConverterForm(), // reusable widget
      ),
    );
  }
}
