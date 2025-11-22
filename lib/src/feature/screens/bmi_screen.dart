import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_healt_app/src/feature/widgets/my_health_app_drawer.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController(); // Controla el campo de peso
  final TextEditingController _heightController = TextEditingController(); // Controla el campo de altura
  double? _bmi;      // Guarda el valor calculado del IMC
  String? _category; // Guarda la categoría según el rango del IMC

  // Calcula el IMC usando peso (kg) y altura (cm). Convierte altura a metros antes de calcular.
  void _calculateBMI() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;
    if (weight > 0 && height > 0) {
      final double heightInMeters = height / 100; // Conversión de cm a metros (IMC usa m²)
      setState(() {
        _bmi = weight / (heightInMeters * heightInMeters); // Fórmula estándar del IMC
        _category = _determineCategory(_bmi!); // Asigna la categoría según el resultado
      });
    }
  }

  // Determina la categoría de salud según los rangos estándar
  String _determineCategory(double bmi) {
    if (bmi < 18.5)
      return "Underweight";
    else if (bmi < 25)
      return "Normal";
    else if (bmi < 30)
      return "Overweight";
    else
      return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Menú lateral reutilizable en toda la app
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo para ingresar peso en kilogramos
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
                hintText: 'Enter your weight in kg',
              ),
            ),
            SizedBox(height: 20),
            // Campo para ingresar altura en centímetros (más intuitivo para el usuario)
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
                hintText: 'Enter your height in cm',
              ),
            ),
            SizedBox(height: 20),
            // Botón que dispara el cálculo
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            // Muestra el resultado solo si ya se calculó
            if (_bmi != null)
              Text(
                'Your BMI: ${_bmi!.toStringAsFixed(2)} ($_category)',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
