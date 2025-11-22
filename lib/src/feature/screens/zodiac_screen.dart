import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_healt_app/src/feature/widgets/my_health_app_drawer.dart';

class ZodiacScreen extends StatefulWidget {
  @override
  _ZodiacScreenState createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  final TextEditingController _nameController = TextEditingController(); // Para capturar el nombre del usuario
  DateTime? _selectedDate;  // Almacena la fecha de nacimiento seleccionada
  String? _zodiacSign;      // Guarda el signo zodiacal calculado

  // Abre el selector de fecha y, al elegir una, determina el signo zodiacal
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _zodiacSign = _determineZodiacSign(pickedDate); // Llama a la función que identifica el signo
      });
    });
  }

  // Determina el signo zodiacal según el día y mes de nacimiento (basado en fechas tradicionales)
  String _determineZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return "Pisces";
    }
    return "Unknown"; // Caso improbable, pero por seguridad
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Menú lateral reutilizable en toda la app
      appBar: AppBar(title: Text("Zodiac Sign Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Comienza desde arriba (no centrado)
          children: [
            // Campo para ingresar el nombre (le da un toque personal al resultado)
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Botón para seleccionar fecha de nacimiento
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text(
                _selectedDate == null
                    ? 'Pick your birthdate'
                    : 'Change birthdate',
              ),
            ),
            SizedBox(height: 20),
            // Muestra un mensaje personalizado solo si ya se determinó el signo
            if (_zodiacSign != null)
              Text(
                'Hello, ${_nameController.text}! Your Zodiac Sign is $_zodiacSign.',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
