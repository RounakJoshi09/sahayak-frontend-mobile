import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sahayak_application/models/Appointment.dart';
import 'package:sahayak_application/utils/TextStyle.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';
import 'package:sahayak_application/utils/widgets/history_card_widget.dart';
import 'package:http/http.dart' as http;

import '../utils/network/connection/APIs.dart';
import '../utils/network/data/storage.dart';

class PresentAppointmentScreen extends StatelessWidget {
  PresentAppointmentScreen({super.key});
  final Helperfunction _helperfunction = Helperfunction();
  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<AppointmentList>(
            future: fetchFutureAppointment(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.appointmentList.isEmpty == true) {
                return Center(
                  child: Text("No Future Appointment",
                      style: subtitle1(color: Colors.grey)),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.appointmentList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HistoryCardWidget(
                        onTap: () {},
                        appointment: snapshot.data!.appointmentList[index],
                      ),
                    );
                  });
            }),
      ),
    );
  }

  Future<AppointmentList> fetchFutureAppointment() async {
    try {
      String patientId = MyStorage.readId;
      debugPrint(Sahayak.futureAppointment(patientId));
      final response = await http.get(
        Uri.parse(Sahayak.futureAppointment(patientId)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());

        return AppointmentList.fromJson(jsonData['data']);
      } else {
        Helperfunction.showToast(jsonDecode(response.body)['message']);
        return AppointmentList([]);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
