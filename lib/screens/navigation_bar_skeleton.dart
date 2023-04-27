// ignore_for_file: unrelated_type_equality_checks, sized_box_for_whitespace, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sahayak_application/screens/history_appointment_screen.dart';
import 'package:sahayak_application/screens/patient_dashboard.dart';
import 'package:sahayak_application/screens/profile_screen.dart';
import 'package:sahayak_application/screens/reminder_screen.dart';
import 'package:sahayak_application/utils/network/notifications/notification_services.dart';

class NavBarSkeleton extends StatefulWidget {
  const NavBarSkeleton({
    super.key,
    this.getIndex = 0,
  });

  final int getIndex;

  @override
  _NavBarSkeleton createState() => _NavBarSkeleton();
}

class _NavBarSkeleton extends State<NavBarSkeleton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleIndexChanged(widget.getIndex);
    _notificationServices.initialiseNotifications();
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  var _selectedTab = _SelectedTab.home;
  final NotificationServices _notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: _selectedTab.index == 0
          ? const PatientDashboard()
          : _selectedTab.index == 1
              ? const HistoryAppointmentScreen()
              : _selectedTab.index == 2
                  ? ReminderScreen()
                  : _selectedTab.index == 3
                      ? ProfileScreen()
                      : Center(child: Text(_selectedTab.name)),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: const Color.fromARGB(255, 241, 233, 239),
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 0),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        dotIndicatorColor: Colors.red,
        unselectedItemColor: const Color.fromARGB(255, 120, 117, 117),
        // enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: const Color(0xff73544C),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.note_alt),
            selectedColor: const Color(0xff73544C),
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            selectedColor: const Color(0xff73544C),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedColor: const Color(0xff73544C),
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, appointment, reminder, profile }
