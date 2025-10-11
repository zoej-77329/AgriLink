import 'package:flutter/material.dart';
import 'crop_calender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriLink',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: CropCalendar(),
    );
  }
}

