import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/baby/baby_screen.dart';
import 'package:momma_life/features/mother/mother_screen.dart';
import 'package:momma_life/features/planning/planning_screen.dart';
import 'package:momma_life/features/library/library_screen.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 4; // Chat tab selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFD98E7E),
      ),

      // ✅ REPLACED BODY WITH INBOX UI
      body: ListView(
        children: [
          _buildChatTile(
            context,
            name: "System Bot",
            message: "Welcome to Momma Life 💕",
            time: "9:45 AM",
            image: null,
            unreadCount: 0,
            navigate: false,
          ),
          _buildChatTile(
            context,
            name: "Midwife",
            message: "How are you feeling today?",
            time: "10:00 AM",
            image: "https://i.pravatar.cc/150?img=47",
            unreadCount: 1,
            navigate: true,
          ),
        ],
      ),

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ✅ INBOX TILE WIDGET
  Widget _buildChatTile(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
    String? image,
    required int unreadCount,
    required bool navigate,
  }) {
    return InkWell(
      onTap: navigate
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChatMessageScreen(),
                ),
              );
            }
          : null,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFEDEDED),
            ),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade300,
              backgroundImage:
                  image != null ? NetworkImage(image) : null,
              child: image == null
                  ? const Icon(Icons.smart_toy,
                      color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style:
                        const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey),
                ),
                if (unreadCount > 0)
                  Container(
                    margin:
                        const EdgeInsets.only(top: 6),
                    padding:
                        const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔽 🔽 🔽 YOUR ORIGINAL NAVIGATION (UNCHANGED) 🔽 🔽 🔽

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
          padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.bedroom_baby, 'Baby', 0),
              _buildNavItem(
                  Icons.pregnant_woman_outlined,
                  'Mother',
                  1),
              _buildNavItem(
                  Icons.calendar_today_outlined,
                  'Appointment',
                  2),
              _buildNavItem(
                  Icons.home_outlined, 'Home', 3),
              _buildNavItem(
                  Icons.chat_bubble_outline,
                  'Chat',
                  4),
              _buildNavItem(
                  Icons.menu_book_outlined,
                  'Library',
                  5),
              _buildNavItem(
                  Icons.event_note_outlined,
                  'Planning',
                  6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index) {
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
            destination =
                const AppointmentMainScreen();
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
          MaterialPageRoute(
              builder: (context) =>
                  destination),
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
              fontWeight: isSelected
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}