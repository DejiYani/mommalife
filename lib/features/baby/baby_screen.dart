import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/mother/mother_screen.dart';
import 'package:momma_life/features/chat/chat_screen.dart';
import 'package:momma_life/features/library/library_screen.dart';
import 'package:momma_life/features/planning/planning_screen.dart';
import 'dart:async';

class BabyScreen extends StatefulWidget {
  const BabyScreen({super.key});

  @override
  State<BabyScreen> createState() => _BabyScreenState();
}

class _BabyScreenState extends State<BabyScreen> {
  int _selectedIndex = 0; // Baby tab selected
  int _kickCount = 0;
  bool _sessionActive = false;
  int _secondsElapsed = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby'),
        backgroundColor: const Color(0xFFD98E7E),
      ),
      body: SingleChildScrollView(
  child: Column(
    children: [

      // ================= HEADER =================
      Stack(
        children: [
          Container(
            height: 260,
            width: double.infinity,
            color: const Color(0xFFD98E7E),
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Column(
              children: const [
                Text(
                  "Baby's Journey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Week 15: Your baby is the size of a Strawberry",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: Icon(Icons.child_care,
                size: 80, color: Colors.white.withOpacity(0.9)),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: Icon(Icons.local_florist,
                size: 80, color: Colors.white.withOpacity(0.9)),
          ),
        ],
      ),

      // ================= PROGRESS CARD =================
      Transform.translate(
        offset: const Offset(0, -30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Pregnancy Term",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                const Text("Trimester 2: 15 weeks, 5 days"),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const LinearProgressIndicator(
                    value: 0.55,
                    minHeight: 12,
                    backgroundColor: Color(0xFFFFE5DF),
                    color: Color(0xFFD98E7E),
                  ),
                ),
                const SizedBox(height: 8),
                const Text("170 Day(s) left"),
                const Text("Estimated Delivery: Oct 15, 2026"),
              ],
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= DEVELOPMENT =================
            const Text(
              "This Week's Development",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                _buildDevCard(Icons.psychology, "Brain\nDevelopment"),
                const SizedBox(width: 8),
                _buildDevCard(Icons.favorite, "Heart is\nFully Formed"),
                const SizedBox(width: 8),
                _buildDevCard(Icons.back_hand, "Tiny Fingers\n& Toes"),
              ],
            ),

            const SizedBox(height: 30),

            // ================= KICK COUNTER =================
            const Text(
              "Kick Counter",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _sessionActive
                        ? () {
                            setState(() {
                              _kickCount++;
                            });
                          }
                        : null,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFD98E7E),
                      ),
                      child: const Center(
                        child: Text(
                          "KICK",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Kick Count: $_kickCount"),
                  const SizedBox(height: 8),
                  Text("Session Time: ${_secondsElapsed}s"),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE5DF),
                      foregroundColor: const Color(0xFFD98E7E),
                    ),
                    onPressed: _toggleSession,
                    child: Text(
                        _sessionActive ? "End Session" : "Start Session"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= MEDIA =================
            const Text(
              "Watch a Baby's Journey",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            _buildMediaPlaceholder(),
            const SizedBox(height: 12),
            _buildMediaPlaceholder(),
          ],
        ),
      ),
    ],
  ),
),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.bedroom_baby, 'Baby', 0),
              _buildNavItem(Icons.pregnant_woman_outlined, 'Mother', 1),
              _buildNavItem(Icons.calendar_today_outlined, 'Appointment', 2),
              _buildNavItem(Icons.home_outlined, 'Home', 3),
              _buildNavItem(Icons.chat_bubble_outline, 'Chat', 4),
              _buildNavItem(Icons.menu_book_outlined, 'Library', 5),
              _buildNavItem(Icons.event_note_outlined, 'Planning', 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return InkWell(
      onTap: () {
        if (_selectedIndex == index) return;

        setState(() {
          _selectedIndex = index;
        });

        Widget destination;

        switch (index) {
          case 0:
            destination = const BabyScreen();
            break;
          case 1:
            destination = const MotherScreen();
            break;
          case 2:
            destination = const AppointmentMainScreen();
            break;
          case 3:
            destination = const PatientHomePage();
            break;
          case 4:
            destination = const ChatScreen();
            break;
          case 5:
            destination = const LibraryScreen();
            break;
          case 6:
            destination = const PlanningScreen();
            break;
          default:
            destination = const PatientHomePage();
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(0xFFD98E7E)
                : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? const Color(0xFFD98E7E)
                  : Colors.grey,
              fontWeight:
                  isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
Widget _buildDevCard(IconData icon, String text) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE5DF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFD98E7E)),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMediaPlaceholder() {
  return Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Center(
      child: Icon(Icons.play_circle_fill, size: 50),
    ),
  );
}

void _toggleSession() {
  if (_sessionActive) {
    _timer?.cancel();
  } else {
    _kickCount = 0;
    _secondsElapsed = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  setState(() {
    _sessionActive = !_sessionActive;
  });
}

@override
void dispose() {
  _timer?.cancel();
  super.dispose();
}

}
