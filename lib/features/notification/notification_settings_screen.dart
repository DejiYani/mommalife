import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  static const Color terracottaColor = Color(0xFFD98E7E);
  static const Color subtitleColor = Color(0xFFA36361); // subtitle color

  bool emailNotifications = true;
  bool inAppNotifications = false;
  bool emailUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    _buildInfoBox(),
                    const SizedBox(height: 32),
                    _buildSettingsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFFA36361)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Expanded(
                child: Text(
                  'Notifications Setting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA36361),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(width: 48), // balance the back button
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

  Widget _buildInfoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'In this section, you will be able to manage notifications. '
        'We will continue to send you notifications for security reasons '
        'or if we need to contact you about your account.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: subtitleColor,
          height: 1.5,
        ),
      ),
    );
  }

  // ✅ Only one _buildSettingItem method
  Widget _buildSettingItem({
    required String title,
    required Widget subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                subtitle, // use the widget directly
              ],
            ),
          ),
          const SizedBox(width: 16),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: terracottaColor,
            activeTrackColor: terracottaColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingItem(
          title: 'Email notifications',
          subtitle: Text(
            'You will receive an email about any notification regularly.',
            style: const TextStyle(
              color: subtitleColor,
              fontSize: 14,
            ),
          ),
          value: emailNotifications,
          onChanged: (value) {
            setState(() {
              emailNotifications = value;
            });
          },
        ),
        Divider(
          color: Colors.grey[200],
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        _buildSettingItem(
          title: 'In app notifications',
          subtitle: Text(
            'You will receive a notification inside the application.',
            style: const TextStyle(
              color: subtitleColor,
              fontSize: 14,
            ),
          ),
          value: inAppNotifications,
          onChanged: (value) {
            setState(() {
              inAppNotifications = value;
            });
          },
        ),
        Divider(
          color: Colors.grey[200],
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        _buildSettingItem(
          title: 'Email updates',
          subtitle: Text(
            'You will receive a notification about application updates.',
            style: const TextStyle(
              color: subtitleColor,
              fontSize: 14,
            ),
          ),
          value: emailUpdates,
          onChanged: (value) {
            setState(() {
              emailUpdates = value;
            });
          },
        ),
      ],
    );
  }
}
