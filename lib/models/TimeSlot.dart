// ignore_for_file: file_names

class TimeSlot {
  String slotStart;
  String slotEnd;
  String totalAppointmentsAllowed;
  String approximateTurnTime;
  TimeSlot(
      {required this.slotEnd,
      required this.slotStart,
      required this.totalAppointmentsAllowed,
      required this.approximateTurnTime});

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
        slotEnd: json['slot_end'],
        slotStart: json['slot_start'],
        totalAppointmentsAllowed: json['maximum_appointment'],
        approximateTurnTime: json['approximate_turn_time']);
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
