// ignore_for_file: library_private_types_in_public_api

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';


class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _DatePickerWidget createState() => _DatePickerWidget();
}

class _DatePickerWidget extends State<DatePickerWidget> {
  final DatePickerController _controller = DatePickerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 8),
      child: DatePicker(
        DateTime.now(),
        width: 60,
        height: 80,
        controller: _controller,
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color.fromARGB(248, 11, 212, 206),
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          // New date selected
          setState(() {
          });
        },
      ),
    );
  }
}