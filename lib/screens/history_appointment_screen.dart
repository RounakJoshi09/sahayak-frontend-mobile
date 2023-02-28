// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sahayak_application/screens/past_appointment_screen.dart';
import 'package:sahayak_application/screens/present_appointment_screen.dart';

class HistoryAppointmentScreen extends StatefulWidget {
  const HistoryAppointmentScreen({Key? key}) : super(key: key);
  @override
  _HistoryAppointmentScreen createState() => _HistoryAppointmentScreen();
}

class _HistoryAppointmentScreen extends State<HistoryAppointmentScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Present History'),
    const Tab(text: 'Past History'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointment History"),
        backgroundColor: const Color.fromARGB(248, 11, 212, 206),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [PresentAppointmentScreen(), PastAppointmentScreen()]),
    );
  }
}
