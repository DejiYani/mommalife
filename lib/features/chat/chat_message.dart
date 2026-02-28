import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/baby/baby_screen.dart';
import 'package:momma_life/features/mother/mother_screen.dart';
import 'package:momma_life/features/planning/planning_screen.dart';
import 'package:momma_life/features/library/library_screen.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  State<ChatMessageScreen> createState() =>
      _ChatMessageScreenState();
}

class _ChatMessageScreenState
    extends State<ChatMessageScreen> {
  int _selectedIndex = 4; // Keep chat selected

  final List<Map<String, dynamic>> _messages = [
    {"text": "Hello dear 💕", "isMe": false},
    {"text": "Hi midwife!", "isMe": true},
    {"text": "How are you feeling today?", "isMe": false},
  ];

  final TextEditingController _controller =
      TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        "text": _controller.text,
        "isMe": true,
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFFD98E7E),
        leading:
            const BackButton(color: Colors.white),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=47"),
            ),
            SizedBox(width: 10),
            Text(
              "Midwife",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder:
                  (context, index) {
                final msg =
                    _messages[index];
                return _buildBubble(
                    msg["text"],
                    msg["isMe"]);
              },
            ),
          ),
          _buildInputBar(),
        ],
      ),

      // ✅ YOUR BOTTOM NAVBAR (UNCHANGED)
      bottomNavigationBar:
          _buildBottomNavigation(),
    );
  }

  // ================= CHAT BUBBLE =================

  Widget _buildBubble(
      String text, bool isMe) {
    return Align(
      alignment: isMe
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          if (!isMe)
            const Padding(
              padding:
                  EdgeInsets.only(right: 6),
              child: CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=47"),
              ),
            ),
          Container(
            margin:
                const EdgeInsets.symmetric(
                    vertical: 6),
            padding:
                const EdgeInsets.all(12),
            constraints:
                const BoxConstraints(
                    maxWidth: 250),
            decoration: BoxDecoration(
              color: isMe
                  ? const Color(0xFFD98E7E)
                  : Colors.white,
              borderRadius:
                  BorderRadius.circular(16),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= INPUT BAR =================

  Widget _buildInputBar() {
    return Container(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(
              Icons.add_circle_outline,
              color:
                  Color(0xFFD98E7E)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration(
                hintText: "Type here...",
                filled: true,
                fillColor:
                    const Color(
                        0xFFFCE8E4),
                contentPadding:
                    const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10),
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                          30),
                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.send,
              color:
                  Color(0xFFD98E7E),
            ),
            onPressed: _sendMessage,
          )
        ],
      ),
    );
  }

  // ================= YOUR ORIGINAL NAVIGATION =================

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.05),
            blurRadius: 10,
            offset:
                const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround,
            children: [
              _buildNavItem(
                  Icons.bedroom_baby,
                  'Baby',
                  0),
              _buildNavItem(
                  Icons
                      .pregnant_woman_outlined,
                  'Mother',
                  1),
              _buildNavItem(
                  Icons
                      .calendar_today_outlined,
                  'Appointment',
                  2),
              _buildNavItem(
                  Icons.home_outlined,
                  'Home',
                  3),
              _buildNavItem(
                  Icons
                      .chat_bubble_outline,
                  'Chat',
                  4),
              _buildNavItem(
                  Icons
                      .menu_book_outlined,
                  'Library',
                  5),
              _buildNavItem(
                  Icons
                      .event_note_outlined,
                  'Planning',
                  6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon,
      String label,
      int index) {
    final isSelected =
        _selectedIndex == index;

    return InkWell(
      onTap: () {
        if (_selectedIndex ==
            index) return;

        setState(() {
          _selectedIndex = index;
        });

        Widget destination;

        switch (index) {
          case 0:
            destination =
                const BabyScreen();
            break;
          case 1:
            destination =
                const MotherScreen();
            break;
          case 2:
            destination =
                const AppointmentMainScreen();
            break;
          case 3:
            destination =
                const PatientHomePage();
            break;
          case 4:
            destination =
                const ChatMessageScreen();
            break;
          case 5:
            destination =
                const LibraryScreen();
            break;
          case 6:
            destination =
                const PlanningScreen();
            break;
          default:
            destination =
                const PatientHomePage();
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder:
                  (context) =>
                      destination),
        );
      },
      child: Column(
        mainAxisSize:
            MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(
                    0xFFD98E7E)
                : Colors.grey,
            size: 24,
          ),
          const SizedBox(
              height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? const Color(
                      0xFFD98E7E)
                  : Colors.grey,
              fontWeight:
                  isSelected
                      ? FontWeight
                          .w600
                      : FontWeight
                          .normal,
            ),
          ),
        ],
      ),
    );
  }
}