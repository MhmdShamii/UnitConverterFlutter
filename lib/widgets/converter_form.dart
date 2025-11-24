import 'package:flutter/material.dart';

class ConverterForm extends StatefulWidget {
  const ConverterForm({super.key});

  @override
  State<ConverterForm> createState() => _ConverterFormState();
}

class _ConverterFormState extends State<ConverterForm> {
  // Categories
  final List<String> categories = ["Length", "Weight", "Temperature"];
  String selectedCategory = "Length";

  // Units per category
  final Map<String, List<String>> units = {
    "Length": ["Meter", "Kilometer", "Centimeter"],
    "Weight": ["Gram", "Kilogram", "Pound"],
    "Temperature": ["Celsius", "Fahrenheit", "Kelvin"],
  };

  String fromUnit = "Meter";
  String toUnit = "Kilometer";

  double inputValue = 0;
  double result = 0;

  void convert() {
    double value = inputValue;

    // LENGTH
    if (selectedCategory == "Length") {
      double inMeters = value;
      if (fromUnit == "Kilometer") inMeters = value * 1000;
      if (fromUnit == "Centimeter") inMeters = value / 100;

      if (toUnit == "Meter") result = inMeters;
      if (toUnit == "Kilometer") result = inMeters / 1000;
      if (toUnit == "Centimeter") result = inMeters * 100;
    }

    // WEIGHT
    if (selectedCategory == "Weight") {
      double inGrams = value;
      if (fromUnit == "Kilogram") inGrams = value * 1000;
      if (fromUnit == "Pound") inGrams = value * 453.592;

      if (toUnit == "Gram") result = inGrams;
      if (toUnit == "Kilogram") result = inGrams / 1000;
      if (toUnit == "Pound") result = inGrams / 453.592;
    }

    // TEMPERATURE
    if (selectedCategory == "Temperature") {
      double inCelsius = value;
      if (fromUnit == "Fahrenheit") inCelsius = (value - 32) * 5 / 9;
      if (fromUnit == "Kelvin") inCelsius = value - 273.15;

      if (toUnit == "Celsius") result = inCelsius;
      if (toUnit == "Fahrenheit") result = (inCelsius * 9 / 5) + 32;
      if (toUnit == "Kelvin") result = inCelsius + 273.15;
    }
  }

  void onCategoryChange(String newCat) {
    setState(() {
      selectedCategory = newCat;
      fromUnit = units[newCat]![0];
      toUnit = units[newCat]![1];
      inputValue = 0;
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUnits = units[selectedCategory]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Category dropdown
        DropdownButtonFormField<String>(
          value: selectedCategory,
          items: categories
              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
              .toList(),
          onChanged: (val) => onCategoryChange(val!),
          decoration: const InputDecoration(
            labelText: "Category",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 16),

        // Input field
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Enter value",
            border: OutlineInputBorder(),
          ),
          onChanged: (val) {
            setState(() {
              inputValue = double.tryParse(val) ?? 0;
              convert();
            });
          },
        ),

        const SizedBox(height: 16),

        // From dropdown
        DropdownButtonFormField<String>(
          value: fromUnit,
          items: currentUnits
              .map((u) => DropdownMenuItem(value: u, child: Text(u)))
              .toList(),
          onChanged: (val) {
            setState(() {
              fromUnit = val!;
              convert();
            });
          },
          decoration: const InputDecoration(
            labelText: "From",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 16),

        // To dropdown
        DropdownButtonFormField<String>(
          value: toUnit,
          items: currentUnits
              .map((u) => DropdownMenuItem(value: u, child: Text(u)))
              .toList(),
          onChanged: (val) {
            setState(() {
              toUnit = val!;
              convert();
            });
          },
          decoration: const InputDecoration(
            labelText: "To",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 24),

        // Result
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Result: ${result.toStringAsFixed(4)} $toUnit",
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
