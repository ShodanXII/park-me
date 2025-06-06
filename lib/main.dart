import 'package:flutter/material.dart';
import 'screens/parking_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Parking App',
      home: ParkingHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
