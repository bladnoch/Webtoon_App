import 'package:apptoon/screen/home_screen.dart';
import 'package:apptoon/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}