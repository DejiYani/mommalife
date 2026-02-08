import 'package:flutter/material.dart';
import 'features/auth/intro_screen.dart';

void main() {
  runApp(const MommaLifeApp());
}

class MommaLifeApp extends StatelessWidget {
  const MommaLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MommaLife',
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
    );
  }
}
