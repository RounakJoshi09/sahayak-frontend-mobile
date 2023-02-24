import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class CalendarPage2 extends StatefulWidget {
  const CalendarPage2({super.key});

  @override
  _CalendarPage2State createState() => _CalendarPage2State();
}

List<DateTime> presentDates = [
  DateTime(2020, 11, 1),
  DateTime(2020, 11, 3),
  DateTime(2020, 11, 4),
  DateTime(2020, 11, 5),
  DateTime(2020, 11, 6),
  DateTime(2020, 11, 9),
  DateTime(2020, 11, 10),
  DateTime(2020, 11, 11),
  DateTime(2020, 11, 15),
  DateTime(2020, 11, 22),
  DateTime(2020, 11, 23),
];
List<DateTime> absentDates = [
  DateTime(2020, 11, 2),
  DateTime(2020, 11, 7),
  DateTime(2020, 11, 8),
  DateTime(2020, 11, 12),
  DateTime(2020, 11, 13),
  DateTime(2020, 11, 14),
  DateTime(2020, 11, 16),
  DateTime(2020, 11, 17),
  DateTime(2020, 11, 18),
  DateTime(2020, 11, 19),
  DateTime(2020, 11, 20),
];

class _CalendarPage2State extends State<CalendarPage2> {
  final DateTime _currentDate2 = DateTime.now();
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

  late CalendarCarousel _calendarCarouselNoHeader;

  var len = min(absentDates.length, presentDates.length);
  late double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        presentDates[i],
        Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );
    }

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

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.35,
      weekendTextStyle: const TextStyle(
        color: Colors.red,
      ),
      childAspectRatio: 6 / 4,
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
    return Column(
      children: [
        SizedBox(child: _calendarCarouselNoHeader),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.circle,
                color: Colors.red,
              ),
              Text("Absent"),
              Icon(
                Icons.circle,
                color: Colors.green,
              ),
              Text("Present")
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
