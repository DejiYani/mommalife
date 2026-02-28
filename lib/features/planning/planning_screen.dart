import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/baby/baby_screen.dart';
import 'package:momma_life/features/mother/mother_screen.dart';
import 'package:momma_life/features/chat/chat_screen.dart';
import 'package:momma_life/features/library/library_screen.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  int _selectedIndex = 6; // Planning tab selected

  @override

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _buildSeminarCard(int index) {
  return Container(
    width: 220,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.calendar_month,
          color: Color(0xFFD98E7E),
          size: 32,
        ),
        const SizedBox(height: 12),
        const Text(
          "Postpartum Wellness",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          "May 24 • 10:00 AM\nClinic Conference Room",
          style: TextStyle(fontSize: 12),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFE5DF),
            foregroundColor: const Color(0xFFD98E7E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            setState(() {
              _seminarRegistered[index] = !_seminarRegistered[index];
            });
          },
          child: Text(
            _seminarRegistered[index]
                ? "Registered"
                : "Register",
          ),
        ),
      ],
    ),
  );
}

Widget _buildCheckbox(String title, int index) {
  return CheckboxListTile(
    activeColor: const Color(0xFFD98E7E),
    value: _checklistValues[index],
    onChanged: (value) {
      setState(() {
        _checklistValues[index] = value!;
      });
    },
    title: Text(title),
  );
}

Widget _buildFAQTile(String title, String content) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      iconColor: const Color(0xFFD98E7E),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(content),
        ),
      ],
    ),
  );
}
  final List<bool> _seminarRegistered = [false, false, false];

final List<bool> _checklistValues = [
  false, // Start Folic Acid
  false, // Dental Checkup
  false, // Maintain Healthy Weight
  false, // Review Recovery Guide
  false, // List Questions
  false, // Discuss Spacing
];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning'),
        backgroundColor: const Color(0xFFD98E7E),
      ),
      body: SingleChildScrollView(
  child: Container(
    color: const Color(0xFFFDF4F2), // very light peach background
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ================= REFERRAL SECTION =================
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5DF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Midwife Referral",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your midwife has recommended a follow-up with a Family Planning Specialist.",
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD98E7E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text("Book Consultation"),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // ================= UPCOMING SEMINARS =================
        _buildSectionTitle("Upcoming Seminars"),
        const SizedBox(height: 12),

        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildSeminarCard(index);
            },
          ),
        ),

        const SizedBox(height: 24),

        // ================= CHECKLIST =================
        _buildSectionTitle("Pre-conception Checklist"),
        const SizedBox(height: 12),

        Column(
          children: [
            _buildCheckbox("Start Folic Acid", 0),
            _buildCheckbox("Dental Checkup", 1),
            _buildCheckbox("Maintain Healthy Weight", 2),
            _buildCheckbox("Review Recovery Guide", 3),
            _buildCheckbox("List Questions", 4),
            _buildCheckbox("Discuss Spacing", 5),
          ],
        ),

        const SizedBox(height: 24),

        // ================= INFORMATION CENTER =================
        _buildSectionTitle("Information Center"),
        const SizedBox(height: 12),

        _buildFAQTile(
          "Available Contraceptives",
          "We offer counseling on pills, implants, IUDs, injectables, and natural methods.",
        ),

        _buildFAQTile(
          "Birth Spacing Benefits",
          "Proper spacing reduces risks for both mother and baby and improves long-term health outcomes.",
        ),

        _buildFAQTile(
          "When to Resume Family Planning",
          "Discuss with your provider during your postpartum visit to create a personalized plan.",
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
}
