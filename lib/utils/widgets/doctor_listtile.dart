import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Doctor.dart';
import 'package:sahayak_application/screens/appointment_screen.dart';

import '../TextStyle.dart';

Widget doctorListTile(Doctor doctor) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color.fromARGB(255, 127, 82, 234),
              // Color.fromARGB(255, 125, 136, 230)
              Color.fromARGB(255, 7, 190, 148),
              Color.fromARGB(255, 60, 209, 174)
              // Color.fromARGB(248, 11, 212, 206),
              // Color.fromARGB(248, 34, 241, 238),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: ListTile(
        leading: const Icon(
          Icons.person,
          color: Colors.white,
          size: 60,
        ),
        title: Text(
          doctor.fullName,
          style: heading1(color: Colors.white),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              doctor.education,
              style: subtitle1(color: Colors.amberAccent),
            ),
            Text(
              doctor.specialization,
              style: subtitle2(color: Colors.blueAccent),
            ),
          ],
        ),
        onTap: () {
          Get.to(AppointmentScreen(doctor));
        },
      ),
    ),
  );
}
