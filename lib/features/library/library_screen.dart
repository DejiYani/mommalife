import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/baby/baby_screen.dart';
import 'package:momma_life/features/mother/mother_screen.dart';
import 'package:momma_life/features/chat/chat_screen.dart';
import 'package:momma_life/features/planning/planning_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedIndex = 5; // Library tab selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: const Color(0xFFD98E7E),
      ),
      body: SingleChildScrollView(
  child: Container(
    color: const Color(0xFFFDF4F2), // very light peach background
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ================= FEATURED ARTICLE =================
        Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.asset(
                    'assets/images/pregnant.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD98E7E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Featured Article",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    padding: const EdgeInsets.all(12),
                    color: Colors.white.withOpacity(0.85),
                    child: const Text(
                      "Stay Active, Stay Healthy: Safe Exercises for 2nd Trimester",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ================= SEARCH BAR =================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search records here...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // ================= WEEKLY MILESTONES =================
        _buildSectionTitle("Weekly Milestones"),

        const SizedBox(height: 12),

        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildHorizontalCard();
            },
          ),
        ),

        const SizedBox(height: 24),

        // ================= NUTRITION & DIET =================
        _buildSectionTitle("Nutrition & Diet"),

        const SizedBox(height: 12),

        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildHorizontalCard();
            },
          ),
        ),

        const SizedBox(height: 24),

        // ================= PREPARING & PLANNING =================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.calendar_month,
                  color: Color(0xFFD98E7E),
                  size: 40,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Preparing & Planning\nWhat to expect during pregnancy..",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),
      ],
    ),
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
  
  
  Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "See All",
          style: TextStyle(
            color: Color(0xFFD98E7E),
          ),
        ),
      ],
    ),
  );
}

Widget _buildHorizontalCard() {
  return Container(
    width: 140,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.pregnant_woman,
          color: Color(0xFFD98E7E),
          size: 32,
        ),
        const SizedBox(height: 12),
        const Text(
          "Momma's Journey",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFD98E7E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Reading M...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ],
    ),
  );
}
}
