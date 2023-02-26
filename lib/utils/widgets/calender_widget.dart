// ignore_for_file: must_be_immutable, unused_element

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

import '../../controllers/state_manager_controller.dart';

class CalendarPage2 extends StatelessWidget {
  List<DateTime> presentDates = [
    DateTime(2023, 2, 8),
    DateTime(2023, 2, 9),
    DateTime(2023, 2, 10),
    DateTime(2023, 2, 11),
    DateTime(2023, 2, 12),
    DateTime(2023, 2, 13),
    DateTime(2023, 2, 14),
    DateTime(2023, 2, 15),
    DateTime(2020, 11, 15),
    DateTime(2020, 11, 22),
    DateTime(2020, 11, 23),
  ];
  List<DateTime> absentDates;
  CalendarPage2({super.key, required this.absentDates});
  DateTime? appointmentDate;
  static Widget _presentIcon(String day) => CircleAvatar(
        backgroundColor: Colors.green,
        child: Text(
          day,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );
  static Widget _absentIcon(String day) => CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          day,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );


  late double cHeight;

  @override
  Widget build(BuildContext context) {
    var len = min(absentDates.length, presentDates.length);
    cHeight = MediaQuery.of(context).size.height;
    // for (int i = 0; i < len; i++) {
    //   _markedDateMap.add(
    //     presentDates[i],
    //     Event(
    //       date: presentDates[i],
    //       title: 'Event 5',
    //       icon: _presentIcon(
    //         presentDates[i].day.toString(),
    //       ),
    //     ),
    //   );
    // }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        absentDates[i],
        Event(
          date: absentDates[i],
          title: 'Event 5',
          icon: _absentIcon(
            absentDates[i].day.toString(),
          ),
        ),
      );
    }

    return Column(
      children: [
        GetBuilder<StateManagerController>(
            init: StateManagerController(),
            builder: (controller) {
              return CalendarCarousel<Event>(
                selectedDayButtonColor: Colors.orangeAccent,
                selectedDateTime: controller.appointmentDate.value,
                pageScrollPhysics: const NeverScrollableScrollPhysics(),
                onDayPressed: (selectedDate, p1) {
                  if (absentDates.contains(selectedDate)) {
                    Helperfunction.showToast(
                        "Doctor Not Available for this date");
                    return;
                  } else if (selectedDate.isBefore(
                      DateTime.now().subtract(const Duration(days: 1)))) {
                    Helperfunction.showToast("Hey...You can't go to past");
                    return;
                  }
                  StateManagerController.stateManagerController
                      .setAppointmentDate(selectedDate);
                },
                height: cHeight * 0.45,
                weekendTextStyle: const TextStyle(
                  color: Colors.red,
                ),
                childAspectRatio: 1,
                todayButtonColor: Colors.blue,
                markedDatesMap: _markedDateMap,
                markedDateShowIcon: true,
                markedDateIconMaxShown: 1,
                markedDateMoreShowTotal:
                    null, // null for not showing hidden events indicator
                markedDateIconBuilder: (event) {
                  return event.icon;
                },
              );
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.circle,
                color: Colors.red,
              ),
              Text("Unavailable"),
              // Icon(
              //   Icons.circle,
              //   color: Colors.green,
              // ),
              // Text("Available"),
              Icon(
                Icons.circle,
                color: Colors.orangeAccent,
              ),
              Text("Appointment Date")
            ],
          ),
        ),
      ],
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: <Widget>[
    //     _calendarCarouselNoHeader,
    //     markerRepresent(Colors.red, "Absent"),
    //     markerRepresent(Colors.green, "Present"),
    //   ],
    // );
  }

  Widget markerRepresent(Color color, String data) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: Text(
        data,
      ),
    );
  }
}
