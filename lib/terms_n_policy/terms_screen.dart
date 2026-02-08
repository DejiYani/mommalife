import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: const Color(0xFFA36361), // same color as your buttons
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Here are the Terms & Conditions...\n\n'
            '1. You must agree to the terms.\n'
            '2. Blah blah blah...\n'
            '3. More terms here.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
