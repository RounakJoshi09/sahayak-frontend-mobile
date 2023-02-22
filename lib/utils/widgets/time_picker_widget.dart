// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

 Future<Future<TimeOfDay?>> TimePickerWidget(BuildContext context) async {
  return showTimePicker(
    context: context, 
    initialTime: TimeOfDay.now(),
  );
}
