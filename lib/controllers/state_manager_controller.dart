import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/LeaveDays.dart';
import 'package:http/http.dart' as http;
import 'package:sahayak_application/models/TimeSlot.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

import '../utils/connection/APIs.dart';

class StateManagerController extends GetxController {
  static StateManagerController get stateManagerController =>
      Get.find<StateManagerController>();
  late Rx<DateTime> appointmentDate;

  @override
  void onInit() {
    appointmentDate = DateTime.now().obs;
    // TODO: implement onInit
    super.onInit();
  }

  TimeOfDay selectTime = TimeOfDay.now();
  String formatTime = "Select Time Slot";
  int timeSlotsCount = 1;

  void setAppointmentDate(DateTime selectedDate) {
    appointmentDate.value = selectedDate;
    update();
  }

  DateTime getAppointmentDate() {
    return appointmentDate.value;
  }

  getSelectedDate(TimeOfDay pickedTime) {
    selectTime = pickedTime;
    formatTime =
        "${selectTime.hourOfPeriod.toString()} : ${selectTime.minute.toString()} ${selectTime.period.name}";
    update();
  }

  getTimeSlots() {
    timeSlotsCount = 4;
    update();
  }

  Future<LeaveDaysList> fetchLeaveDays(String doctorId) async {
    try {
      debugPrint(Sahayak.getDoctorsSchedule(doctorId));
      final response = await http.get(
        Uri.parse(Sahayak.getDoctorsSchedule(doctorId)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());
        debugPrint(jsonData['data'][0]['leave_days'].toString());
        return LeaveDaysList.fromJson(
            jsonData['data'][0]['leave_days'] as List<dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<TimeSlotList> fetchTimeSlotByDoctorIdAndDate(
      String doctorId, DateTime date) async {
    try {
      String currentDate = Helperfunction.getDateString(date);
      debugPrint(Sahayak.getDoctorsTimeSlot(doctorId, currentDate));
      final response = await http.get(
        Uri.parse(Sahayak.getDoctorsTimeSlot(doctorId, currentDate)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());
        return TimeSlotList.fromJson(jsonData['data'] as List<dynamic>);
      } else {
        Helperfunction.showToast("Appointments Slots Not Found");
        return TimeSlotList([]);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
