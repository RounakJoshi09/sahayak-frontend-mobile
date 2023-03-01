class Appointment {
  String appointmentEndTime;
  String doctorName;
  String doctorEducation;
  String approximateTurnTime;
  String approximateStartTime;
  String hospitalName;
  String hospitalAddress;
  String appointmentDate;

  Appointment(
      {required this.appointmentEndTime,
      required this.approximateTurnTime,
      required this.approximateStartTime,
      required this.doctorEducation,
      required this.doctorName,
      required this.hospitalAddress,
      required this.hospitalName,
      required this.appointmentDate});

  factory Appointment.fromJson(Map<String, dynamic> data) {
    return Appointment(
        appointmentEndTime: data['appointment_end_time'],
        approximateStartTime: data['appointment_start_time'],
        approximateTurnTime: data['approximate_turn_time'],
        doctorEducation: data['doctor_education'],
        doctorName: data['doctor_name'],
        hospitalAddress: data['hospital_address'],
        hospitalName: data['hospital_name'],
        appointmentDate: data['appointment_date']);
  }
}

class AppointmentList {
  List<Appointment> appointmentList = [];

  AppointmentList(this.appointmentList);

  factory AppointmentList.fromJson(List<dynamic> list) {
    List<Appointment> doctors = [];

    doctors = list.map((i) => Appointment.fromJson(i)).toList();
    return AppointmentList(doctors);
  }
}
