import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'create_account.dart';
import 'package:momma_life/terms_n_policy/terms_screen.dart';
import 'package:momma_life/terms_n_policy/policy_screen.dart';
import 'package:flutter/gestures.dart';

class HoverText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverText({super.key, required this.text, required this.onTap});

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false; // tracks if mouse is over the text

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click, // makes cursor a pointer
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: _isHovered
                ? TextDecoration.underline
                : TextDecoration.none, // underline only when hovered
          ),
        ),
      ),
    );
  }
}

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
              Color(0xFFE89B88),
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
                    foregroundColor: Colors.white,
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
  children: [
    const Text('or '),
    HoverText(
      text: 'Create an account',
      onTap: () {
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateAccount()),
                    );
      },
    ),
  ],
),


              const SizedBox(height: 24),

              // Terms & Policy
RichText(
  textAlign: TextAlign.center,
  text: TextSpan(
    style: const TextStyle(fontSize: 12, color: Colors.black54),
    children: [
      const TextSpan(text: 'I accept the '),
      TextSpan(
        text: 'Terms & Conditions',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TermsScreen()),
            );
          },
      ),
      const TextSpan(text: ' and '),
      TextSpan(
        text: 'Policy',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PolicyScreen()),
            );
          },
      ),
    ],
  ),
),



              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
