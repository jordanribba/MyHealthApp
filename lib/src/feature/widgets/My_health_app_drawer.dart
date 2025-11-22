import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHealthAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('My Health App'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ), // BoxDecoration
          ), // DrawerHeader
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ), // ListTile
          ListTile(
            title: Text('BMI Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/bmi');
            },
          ), // ListTile
          ListTile(
            title: Text('Age Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/age');
            },
          ), // ListTile
          ListTile(
            title: Text('Zodiac Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ), // ListTile
        ], // <Widget>[]
      ), // ListView
    ); // Drawer
  }
}