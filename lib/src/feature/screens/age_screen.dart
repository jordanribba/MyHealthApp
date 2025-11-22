import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_healt_app/src/feature/widgets/my_health_app_drawer.dart';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate; // Almacena la fecha de nacimiento seleccionada por el usuario
  int? _age;               // Guarda la edad calculada a partir de la fecha

  // Abre el selector de fecha y, al elegir una, actualiza la fecha y calcula la edad
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),    // Límite inferior razonable para fechas de nacimiento
      lastDate: DateTime.now(),     // No permite fechas futuras
    ).then((pickedDate) {
      if (pickedDate == null) return; // Si no se elige fecha, no hace nada
      setState(() {
        _selectedDate = pickedDate;
        _age = _calculateAge(pickedDate); // Llama a la función que calcula la edad real
      });
    });
  }

  // Calcula la edad de forma precisa: considera si el cumpleaños ya ocurrió este año
  int _calculateAge(DateTime birthDate) {
    DateTime current = DateTime.now();
    int age = current.year - birthDate.year;
    // Si aún no ha llegado el cumpleaños este año, resta 1
    if (current.month < birthDate.month ||
        (current.month == birthDate.month && current.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Menú lateral reutilizable en toda la app
      appBar: AppBar(title: Text("Age Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text(_selectedDate == null
                  ? 'Select your birthdate'
                  : 'Change birthdate (${_selectedDate!.toIso8601String().substring(0, 10)})'),
            ),
            SizedBox(height: 20),
            // Muestra la edad solo si ya se ha calculado
            if (_age != null)
              Text('You are $_age years old.', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
