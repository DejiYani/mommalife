import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
//import 'login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF4B7A5), // soft peach like your design
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Logo
              Image.asset('assets/images/mommalife_logo.png', height: 180),

              const SizedBox(height: 24),

              // Username field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // later → forgot password screen
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE9A08A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 16),

              // Create account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('or '),
                  Text(
                    'Create an account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Terms
              const Text(
                'I accept the Terms & Conditions and Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
