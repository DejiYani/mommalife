import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: const Color(0xFFA36361),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Here is the Privacy Policy...\n\n'
            '1. Your data will be protected.\n'
            '2. Blah blah blah...\n'
            '3. More details here.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
