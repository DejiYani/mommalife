import 'package:flutter/material.dart';

class PastAppointmentsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> appointments;

  const PastAppointmentsScreen({
    Key? key,
    required this.appointments,
  }) : super(key: key);

  @override
  State<PastAppointmentsScreen> createState() => _PastAppointmentsScreenState();
}

class _PastAppointmentsScreenState extends State<PastAppointmentsScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredAppointments = [];

  @override
  void initState() {
    super.initState();
    filteredAppointments = widget.appointments;
  }

  void _filterAppointments(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredAppointments = widget.appointments;
      } else {
        filteredAppointments = widget.appointments.where((appointment) {
          final type = appointment['type'].toString().toLowerCase();
          final doctor = appointment['doctor'].toString().toLowerCase();
          final status = appointment['status'].toString().toLowerCase();
          final searchLower = query.toLowerCase();

          return type.contains(searchLower) ||
              doctor.contains(searchLower) ||
              status.contains(searchLower);
        }).toList();
      }
    });
  }

  String _formatDate(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

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
      body: Column(
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4F0),
              borderRadius: BorderRadius.circular(25),
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
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search recent visits...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                    ),
                    onChanged: _filterAppointments,
                  ),
                ),
              ],
            ),
          ),

          // Past Appointments Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Past Appointments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Appointments List
          Expanded(
            child: filteredAppointments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No appointments found',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = filteredAppointments[index];
                      return _buildAppointmentCard(appointment);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppointmentCard(Map<String, dynamic> appointment) {
    final isConfirmed = appointment['status'] == 'Confirmed';
    final isCancelled = appointment['status'] == 'Cancelled';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCancelled
            ? Colors.grey[200]
            : const Color(0xFFFFF4F0),
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
                  color: isCancelled ? Colors.grey[600] : Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                appointment['type'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isCancelled ? Colors.grey[700] : Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                appointment['doctor'],
                style: TextStyle(
                  fontSize: 14,
                  color: isCancelled ? Colors.grey[600] : Colors.grey[600],
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
            icon: Icon(
              Icons.more_vert,
              size: 20,
              color: isCancelled ? Colors.grey[500] : Colors.grey[600],
            ),
            onPressed: () {
              _showOptionsMenu(context, appointment);
            },
          ),
        ],
      ),
    );
  }

  void _showOptionsMenu(BuildContext context, Map<String, dynamic> appointment) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.visibility, color: Color(0xFFD98E7E)),
                title: const Text('View Details'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to appointment details
                },
              ),
              ListTile(
                leading: const Icon(Icons.refresh, color: Color(0xFFD98E7E)),
                title: const Text('Reschedule'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to reschedule
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline, color: Colors.red),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  // Handle delete
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFD98E7E),
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Appointment tab
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}