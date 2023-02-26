import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sahayak_application/controllers/doctor_controller.dart';
import 'package:sahayak_application/models/Doctor.dart';

import '../utils/widgets/doctor_listtile.dart';

class HospitalsDoctorScreen extends StatelessWidget {
  String hospitalId;
  String hospitalName;
  DoctorController doctorController = DoctorController();
  HospitalsDoctorScreen({required this.hospitalId, required this.hospitalName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(hospitalName),
        backgroundColor: const Color.fromARGB(248, 11, 212, 206),
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder<DoctorList>(
            future: doctorController.fetchHospitalDoctors(hospitalId),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return const Center(child: CircularProgressIndicator());

              if (snapshot.data!.doctorList.isEmpty) {
                return const Center(
                    child: Text("No Doctors Found for this Hospital"));
              }

              return ListView.builder(
                itemCount: snapshot.data!.doctorList.length,
                itemBuilder: (context, index) {
                  return doctorListTile(snapshot.data!.doctorList[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
