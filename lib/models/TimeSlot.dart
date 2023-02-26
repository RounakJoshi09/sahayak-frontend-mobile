class TimeSlot {
  String slotStart;
  String slotEnd;
  String totalAppointmentsAllowed;

  TimeSlot(
      {required this.slotEnd,
      required this.slotStart,
      required this.totalAppointmentsAllowed});

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
        slotEnd: json['slot_end'],
        slotStart: json['slot_start'],
        totalAppointmentsAllowed: json['maximum_appointment']);
  }
}

class TimeSlotList {
  List<TimeSlot> timeSlotList;
  TimeSlotList(this.timeSlotList);

  factory TimeSlotList.fromJson(List<dynamic> data) {
    List<TimeSlot> timeSlots = [];
    timeSlots = data.map((i) => TimeSlot.fromJson(i)).toList();

    return TimeSlotList(timeSlots);
  }
}
