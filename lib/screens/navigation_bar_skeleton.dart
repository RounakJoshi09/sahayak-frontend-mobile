// ignore_for_file: unrelated_type_equality_checks, sized_box_for_whitespace

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sahayak_application/screens/patient_dashboard.dart';

class NavBarSkeleton extends StatefulWidget {
  const NavBarSkeleton({super.key});

  @override
  _NavBarSkeleton createState() => _NavBarSkeleton();
}

class _NavBarSkeleton extends State<NavBarSkeleton> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: _selectedTab.index == 0
          ? PatientDashboard()
          : Center(child: Text(_selectedTab.name)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
          backgroundColor: const Color.fromARGB(255, 241, 233, 239),
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
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
      ),
    );
  }
}

enum _SelectedTab { home, apoointment, reminder, profile }
