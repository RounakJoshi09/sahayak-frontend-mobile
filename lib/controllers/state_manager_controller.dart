import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateManagerController extends GetxController {
  TimeOfDay selectTime = TimeOfDay.now();
  String formatTime =
      "Select Time Slot";

  getSelectedDate(TimeOfDay pickedTime) {
    selectTime = pickedTime;
    formatTime = "${selectTime.hourOfPeriod.toString()} : ${selectTime.minute.toString()} ${selectTime.period.name}";
    update();
  }
}
