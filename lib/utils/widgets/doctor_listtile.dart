import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Doctor.dart';
import 'package:sahayak_application/screens/appointment_screen.dart';

import '../TextStyle.dart';

Widget doctorListTile(Doctor doctor, String hospitalId) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color.fromARGB(255, 127, 82, 234),
              // Color.fromARGB(255, 125, 136, 230)
              // Color.fromARGB(255, 7, 190, 148),
              // Color.fromARGB(255, 60, 209, 174)
              Color.fromARGB(248, 11, 212, 206),
              Color.fromARGB(248, 34, 241, 238),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ListTile(
        leading: const Icon(
          Icons.person,
          color: Colors.white,
          size: 55,
        ),
        title: Text(
          doctor.fullName,
          style: heading1(color: Colors.white),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.education,
              style: subtitle1(color: Colors.blueAccent),
            ),
            Text(
              doctor.specialization,
              style: subtitle1(color: Colors.blueAccent),
            ),
          ],
        ),
        onTap: () {
          Get.to(AppointmentScreen(doctor, hospitalId));
        },
      ),
    ),
  );
}
