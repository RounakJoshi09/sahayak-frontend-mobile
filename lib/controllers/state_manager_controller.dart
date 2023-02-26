import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
