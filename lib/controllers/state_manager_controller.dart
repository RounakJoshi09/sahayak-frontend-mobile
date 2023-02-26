// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Doctor.dart';
import 'package:sahayak_application/models/LeaveDays.dart';
import 'package:http/http.dart' as http;
import 'package:sahayak_application/models/TimeSlot.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:dio/dio.dart';
import '../models/Response.dart';
import '../utils/connection/APIs.dart';
import '../utils/data/storage.dart';

class StateManagerController extends GetxController {
  static StateManagerController get stateManagerController =>
      Get.find<StateManagerController>();
  late Rx<DateTime> appointmentDate;
  RxInt index = 0.obs;

  @override
  void onInit() {
    appointmentDate = DateTime.now().obs;
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }

  TimeOfDay selectTime = TimeOfDay.now();
  String formatTime = "Select Time Slot";
  int timeSlotsCount = 1;
  String selectedSlotStart = "";
  String selectedSlotEnd = "";

  void setSelectedSlotStart(String slotStart) {
    selectedSlotStart = slotStart;
  }

  void setSelectedSlotEnd(String slotEnd) {
    selectedSlotEnd = slotEnd;
  }

  void setAppointmentDate(DateTime selectedDate) {
    appointmentDate.value = selectedDate;
    update();
  }

  void setIndex(int ind) {
    index.value = ind;
    update();
  }

  int getIndex() {
    return index.value;
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

  Future<CustomResponse> bookAppointment(
      Doctor doctor, String hospitalId) async {
    debugPrint(Sahayak.bookAppointment());
    String patientId = await MyStorage.readId;
    Map<String, dynamic> data = {
      "hospital_id": hospitalId,
      "doctor_id": doctor.id,
      "appointment_date": Helperfunction.getDateString(appointmentDate.value),
      "appointment_start_time": selectedSlotStart,
      "appointment_end_time": selectedSlotEnd,
      "patient_id": patientId,
      "doctor": {
        "full_name": doctor.fullName,
        "specialization": doctor.specialization,
        "education": doctor.education,
        "price": doctor.price
      }
    };
    var dio = Dio();
    var response = await dio
        .post(
      Sahayak.bookAppointment(),
      data: data,
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    )
        .catchError((e) {
      Helperfunction.showToast("Something Went Wrong");
      debugPrint(e.toString());
    });

    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());

      var jsonData = response.data;
      debugPrint(jsonData.toString());
      return CustomResponse(
          message: jsonData['message'], statusCode: response.statusCode!);
    } else {
      return CustomResponse(
          message: response.data['message'], statusCode: response.statusCode!);
    }
  }
}
