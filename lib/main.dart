import 'package:flutter/material.dart';
import 'package:unit_converter/widgets/converter_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Unit Converter')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ConverterForm(),
        ),
      ),
    );
  }
}
