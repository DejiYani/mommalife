import 'package:flutter/material.dart';
import 'notification_settings_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static const Color terracottaColor = Color(0xFFD98E7E);
  static const Color lightPeachColor = Color(0xFFFFF5F5);
  static const Color greyPlaceholderColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildTodaySection(),
                    const SizedBox(height: 24),
                    _buildThisWeekSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: terracottaColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Expanded(
                child: Text(
                  'Notifications',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: terracottaColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: terracottaColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationSettingsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }

  Widget _buildTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Mark all as read functionality
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Mark all read',
                  style: TextStyle(
                    color: terracottaColor,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildNotificationTile(
          type: 'Appointment Reminder:',
          message: '"Don\'t forget! Your prenatal check-up is tomorrow at 10:00 AM with Dr. Smith."',
          time: '10:00 AM',
        ),
        _buildNotificationTile(
          type: 'Daily Vitamin:',
          message: '"Time to take your prenatal vitamins! 💊 Stay healthy, Momma."',
          time: '10:00 AM',
        ),
        _buildNotificationTile(
          type: 'Appointment Reminder:',
          message: '"Don\'t forget! Your prenatal check-up is tomorrow at 10:00 AM with Dr. Smith."',
          time: '10:00 AM',
        ),
      ],
    );
  }

  Widget _buildThisWeekSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'This Week',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        _buildNotificationTile(
          type: 'Appointment Reminder:',
          message: '"Don\'t forget! Your prenatal check-up is tomorrow at 10:00 AM with Dr. Smith."',
          time: '10:00 AM',
        ),
        _buildNotificationTile(
          type: 'Appointment Reminder:',
          message: '"Don\'t forget! Your prenatal check-up is tomorrow at 10:00 AM with Dr. Smith."',
          time: '10:00 AM',
        ),
        _buildNotificationTile(
          type: 'Appointment Reminder:',
          message: '"Don\'t forget! Your prenatal check-up is tomorrow at 10:00 AM with Dr. Smith."',
          time: '10:00 AM',
        ),
        _buildNotificationTile(
          type: 'Appointment Reminder:',
          message: '"Don\'t forget! Your prenatal check-up is tomorrow at 10:00 AM with Dr. Smith."',
          time: '10:00 AM',
        ),
      ],
    );
  }

  Widget _buildNotificationTile({
    required String type,
    required String message,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: lightPeachColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grey placeholder icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: greyPlaceholderColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: type,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: terracottaColor,
                        ),
                      ),
                      TextSpan(
                        text: ' $message',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
