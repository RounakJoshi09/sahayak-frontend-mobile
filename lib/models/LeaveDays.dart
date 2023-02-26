import 'package:flutter/material.dart';

class LeaveDaysList {
  List<DateTime> leaveDates;
  LeaveDaysList({required this.leaveDates});

  factory LeaveDaysList.fromJson(List<dynamic> data) {
    List<DateTime> dates = [];

    dates = data.map((e) {
      return DateTime.parse(e);
    }).toList();
    return LeaveDaysList(leaveDates: dates);
  }
}
