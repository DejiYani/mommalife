import 'package:flutter/material.dart';
import 'package:momma_life/features/home/home_screen.dart';
import 'package:momma_life/features/appointment/appointment_main.dart';
import 'package:momma_life/features/baby/baby_screen.dart';
import 'package:momma_life/features/planning/planning_screen.dart';
import 'package:momma_life/features/library/library_screen.dart';
import 'package:momma_life/features/chat/chat_screen.dart';

class MotherScreen extends StatefulWidget {
  const MotherScreen({super.key});

  @override
  State<MotherScreen> createState() => _MotherScreenState();
}

class _MotherScreenState extends State<MotherScreen> {
  int _selectedIndex = 1; // Mother tab selected

  @override
  final TextEditingController _bpController = TextEditingController();
final TextEditingController _sugarController = TextEditingController();
final TextEditingController _tempController = TextEditingController();

String _riskLevel = "Low";
String _riskMessage = "All indicators are within a healthy range.";
Color _riskColor = const Color(0xFFB8E6C1);

String _selectedMood = "🙂";

List<Map<String, String>> _recentLogs = [
    {"mood": "😊", "bp": "120/80", "bs": "95 mg/dL", "temp": "98.6°F", "time": "11:45 PM"},
    {"mood": "😐", "bp": "120/80", "bs": "95 mg/dL", "temp": "98.6°F", "time": "11:45 PM"},
    {"mood": "😐", "bp": "120/80", "bs": "95 mg/dL", "temp": "98.6°F", "time": "11:45 PM"},
  ];

Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4F2), // Overall background
      appBar: AppBar(
        title: const Text('Mother', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFD98E7E),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= TOP HEADER DESIGN =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                color: Color(0xFFD98E7E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE6E1), // Light peach banner
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Risk Level: $_riskLevel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: _riskLevel == "High" ? Colors.red[800] : const Color(0xFFD98E7E),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _riskMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Color(0xFF8E6B5E)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ================= LOG VITALS =================
                  const Text("Log Your Vitals", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  _buildVitalsInput(), // Your existing input row

                  const SizedBox(height: 30),

                  // ================= RECENT LOGS =================
                  const Text("Recent Logs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Column(
                    children: _recentLogs.map((log) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFD98E7E))),
                              child: Text(log["mood"]!, style: const TextStyle(fontSize: 20)),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "BP: ${log["bp"]}, BS: ${log["sugar"]} mg/dL, ${log["temp"]}°F, ${log["time"]}",
                                style: const TextStyle(color: Color(0xFFD98E7E), fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // ================= MOOD SELECTOR =================
                  const Center(child: Text("How are you feeling?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ["😄", "😊", "😐", "😔", "😫"].map((emoji) {
                      final isSelected = _selectedMood == emoji;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedMood = emoji),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFD98E7E) : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFD98E7E)),
                          ),
                          child: Text(emoji, style: TextStyle(fontSize: 30, color: isSelected ? Colors.white : null)),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // ================= SAVE BUTTON =================
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE99E8E), // Lighter coral/peach
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                      ),
                      onPressed: _saveLog,
                      child: const Text("Save Log", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ================= PREDICTIVE INSIGHTS =================
                  const Text("Insights & Recommendations", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE6E1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Keep up the great work! Consistent logging helps us on tracking pregnancy. Remember to stay hydrated!",
                      style: TextStyle(color: Color(0xFFD98E7E), height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
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
Widget _buildVitalsInput() {
  return Row(
    children: [
      _vitalsField("Systolic BP", _bpController),
      const SizedBox(width: 10),
      _vitalsField("Blood Sugar", _sugarController),
      const SizedBox(width: 10),
      _vitalsField("Body Temp °F", _tempController),
    ],
  );
}

Widget _vitalsField(String label, TextEditingController controller) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFD98E7E),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    ),
  );
}

void _saveLog() {
  final bp = int.tryParse(_bpController.text) ?? 0;

  setState(() {
    if (bp > 140) {
      _riskLevel = "High";
      _riskMessage =
          "Your BP is elevated. Please rest and consult your provider.";
      _riskColor = Colors.red.shade200;
    } else if (bp > 130) {
      _riskLevel = "Medium";
      _riskMessage =
          "Your BP is slightly elevated. Stay hydrated and monitor closely.";
      _riskColor = Colors.orange.shade200;
    } else {
      _riskLevel = "Low";
      _riskMessage =
          "All indicators are within a healthy range.";
      _riskColor = const Color(0xFFB8E6C1);
    }

    _recentLogs.insert(0, {
      "mood": _selectedMood,
      "bp": _bpController.text,
      "sugar": _sugarController.text,
      "temp": _tempController.text,
      "time": "Just now"
    });

    _bpController.clear();
    _sugarController.clear();
    _tempController.clear();
  });
}

}
