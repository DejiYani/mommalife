import 'package:flutter/material.dart';
import 'package:momma_life/features/home/profile_page.dart';
import 'package:momma_life/features/notification/notifications_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/baby/baby_screen.dart';
import 'package:momma_life/features/mother/mother_screen.dart';
import 'package:momma_life/features/chat/chat_screen.dart';
import 'package:momma_life/features/library/library_screen.dart';
import 'package:momma_life/features/planning/planning_screen.dart';


void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Homepage',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'SF Pro',
      ),
      home: const PatientHomePage(),
    );
  }
}

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({super.key});

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  int _selectedIndex = 3; // Home is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 243, 195, 183),
              Color(0xFFE89B88),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildMoodLoggerCard(),
                  const SizedBox(height: 20),
                  _buildAppointmentsSection(),
                  const SizedBox(height: 20),
                  _buildMyHealthCard(),
                  const SizedBox(height: 16),
                  _buildSymptomsSection(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  },
  borderRadius: BorderRadius.circular(30),
  child: Row(
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFD98E7E), width: 2),
        ),
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=47',
          ),
        ),
      ),
      const SizedBox(width: 10),
      const Text(
        'Ianne Mae',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD98E7E),
        ),
      ),
    ],
  ),
),

        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: const Color(0xFFD98E7E),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMoodLoggerCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How are you feeling today, Momma?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD98E7E),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMoodIcon('😊', 'Happy'),
              _buildMoodIcon('😌', 'Calm'),
              _buildMoodIcon('😐', 'Okay'),
              _buildMoodIcon('😰', 'Anxious'),
              _buildMoodIcon('😢', 'Sad'),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD98E7E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Log Mood',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodIcon(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF0ED),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 28),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to appointments screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentMainScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Show all →',
                  style: TextStyle(
                    color: Color(0xFFD98E7E),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'January 2026',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildCalendarWeek(),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                const Text(
                  'Appointment in',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '1 Day(s)',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD98E7E),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Navigate to appointments screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppointmentMainScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'View appointment details',
                    style: TextStyle(
                      color: Color(0xFFD98E7E),
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFD98E7E),
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Navigate to appointments screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppointmentMainScreen(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: const Color(0xFFD98E7E),
                        size: 24,
                      ),
                      const Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFD98E7E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarWeek() {
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final dates = [18, 19, 20, 21, 22, 23, 24];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        final isToday = dates[index] == 20;
        return Column(
          children: [
            Text(
              days[index],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isToday ? const Color(0xFFD98E7E) : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${dates[index]}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isToday ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildMyHealthCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Health',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'My Pregnancy Term',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Trimester 2: 15 weeks, 5 days',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.45,
              backgroundColor: Colors.white,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFD98E7E),
              ),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '170 Day(s) left',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'View',
                style: TextStyle(
                  color: Color(0xFFD98E7E),
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Symptoms',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildSymptomItem(Icons.add, 'Add', isAdd: true),
                const SizedBox(width: 12),
                _buildSymptomItem(Icons.person_outline, 'Weakness'),
                const SizedBox(width: 12),
                _buildSymptomItem(Icons.self_improvement, 'Calm'),
                const SizedBox(width: 12),
                _buildSymptomItem(Icons.restaurant_outlined, 'Diet'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomItem(IconData icon, String label, {bool isAdd = false}) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isAdd ? Colors.transparent : Colors.white,
            shape: BoxShape.circle,
            border: isAdd
                ? Border.all(color: const Color(0xFFD98E7E), width: 2)
                : null,
          ),
          child: Icon(
            icon,
            color: const Color(0xFFD98E7E),
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ],
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
          color: isSelected ? const Color(0xFFD98E7E) : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? const Color(0xFFD98E7E) : Colors.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

}