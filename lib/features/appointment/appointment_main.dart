import 'package:flutter/material.dart';
import 'book_appointment.dart';
import 'past_appointments.dart';

class AppointmentMainScreen extends StatefulWidget {
  const AppointmentMainScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentMainScreen> createState() => _AppointmentMainScreenState();
}

class _AppointmentMainScreenState extends State<AppointmentMainScreen> {
  DateTime _focusedDay = DateTime(2026, 1, 23);
  DateTime? _selectedDay = DateTime(2026, 1, 23);

  final List<Map<String, dynamic>> upcomingAppointments = [
    {
      'date': DateTime(2026, 2, 5),
      'time': '10:00 AM',
      'type': 'Prenatal Checkup',
      'doctor': 'Dr. Garcia',
      'status': 'Confirmed',
    },
    {
      'date': DateTime(2026, 2, 5),
      'time': '10:00 AM',
      'type': 'Prenatal Checkup',
      'doctor': 'Dr. Garcia',
      'status': 'Pending',
    },
  ];

  final List<Map<String, dynamic>> pastAppointments = [
    {
      'date': DateTime(2026, 2, 5),
      'time': '10:00 AM',
      'type': 'Prenatal Checkup',
      'doctor': 'Dr. Garcia',
      'status': 'Confirmed',
    },
    {
      'date': DateTime(2026, 2, 5),
      'time': '10:00 AM',
      'type': 'Prenatal Checkup',
      'doctor': 'Dr. Garcia',
      'status': 'Cancelled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFD98E7E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Appointment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar Section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Calendar Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month - 1,
                            );
                          });
                        },
                      ),
                      Text(
                        _getMonthYear(_focusedDay),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month + 1,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Calendar Grid
                  _buildCalendar(),
                ],
              ),
            ),

            // Book Appointment Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookAppointmentScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEFB8A8),
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            // Upcoming Appointments Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: upcomingAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = upcomingAppointments[index];
                      return _buildAppointmentCard(appointment);
                    },
                  ),
                ],
              ),
            ),

            // Past Appointments Section Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Past Appointments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PastAppointmentsScreen(
                            appointments: pastAppointments,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4F0),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey[400],
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Search recent visits...',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildCalendar() {
    final daysInMonth = _getDaysInMonth(_focusedDay.year, _focusedDay.month);
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0 = Sunday

    return Column(
      children: [
        // Weekday headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
              .map((day) => SizedBox(
                    width: 40,
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 8),
        // Calendar days
        ...List.generate(6, (weekIndex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (dayIndex) {
                final dayNumber = weekIndex * 7 + dayIndex - firstWeekday + 1;
                
                if (dayNumber < 1 || dayNumber > daysInMonth) {
                  return const SizedBox(width: 40, height: 40);
                }

                final currentDate = DateTime(_focusedDay.year, _focusedDay.month, dayNumber);
                final isSelected = _selectedDay != null &&
                    currentDate.year == _selectedDay!.year &&
                    currentDate.month == _selectedDay!.month &&
                    currentDate.day == _selectedDay!.day;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDay = currentDate;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFD98E7E) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$dayNumber',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ],
    );
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  String _getMonthYear(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  String _formatDate(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Widget _buildAppointmentCard(Map<String, dynamic> appointment) {
    final isConfirmed = appointment['status'] == 'Confirmed';
    final isCancelled = appointment['status'] == 'Cancelled';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCancelled ? Colors.grey[200] : const Color(0xFFFFF4F0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          // Date/Time Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_formatDate(appointment['date'])}  ${appointment['time']}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                appointment['type'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                appointment['doctor'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Spacer(),

          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isConfirmed
                  ? const Color(0xFFD98E7E)
                  : isCancelled
                      ? Colors.grey[400]
                      : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              appointment['status'],
              style: TextStyle(
                color: isConfirmed || isCancelled ? Colors.white : Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // More Options
          IconButton(
            icon: const Icon(Icons.more_vert, size: 20),
            onPressed: () {},
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }

  int _selectedIndex = 2; // Appointment tab active by default

Widget _buildBottomNavBar() {
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
      if (index == 2) {
        setState(() {
          _selectedIndex = 2;
        });
      } else {
        setState(() {
          _selectedIndex = index;
        });
        // TODO: Add navigation to other screens later
      }
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