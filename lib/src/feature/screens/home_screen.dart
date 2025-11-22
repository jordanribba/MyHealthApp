import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_healt_app/src/feature/widgets/my_health_app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Menú lateral accesible desde la pantalla principal
      appBar: AppBar(title: Text('Welcome to My App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Botón que navega a la pantalla de cálculo de edad usando go_router
            ElevatedButton(
              onPressed: () => context.push('/age'),
              child: Text('Calculate Age'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            // Botón que navega a la pantalla del IMC
            ElevatedButton(
              onPressed: () => context.push('/bmi'),
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            // Botón que navega a la pantalla del signo zodiacal
            ElevatedButton(
              onPressed: () => context.push('/zodiac'),
              child: Text('Determine Zodiac Sign'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}