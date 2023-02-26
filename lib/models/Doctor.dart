class Doctor {
  String id;
  String firstName;
  String lastName;
  String fullName;
  String specialization;
  String experience;
  String education;
  String price;
  int averageConsultationTime;
  Doctor({
    required this.averageConsultationTime,
    required this.education,
    required this.experience,
    required this.firstName,
    required this.fullName,
    required this.id,
    required this.lastName,
    required this.price,
    required this.specialization,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
        averageConsultationTime: json['average_consultation_time'],
        education: json['education'],
        experience: json['experience'],
        firstName: json['first_name'],
        fullName: json['full_name'],
        id: json['id'],
        lastName: json['last_name'],
        price: json['price'],
        specialization: json['specialization']);
  }
}

class DoctorList {
  List<Doctor> doctorList = [];

  DoctorList(this.doctorList);

  factory DoctorList.fromJson(List<dynamic> list) {
    List<Doctor> doctors = [];

    doctors = list.map((i) => Doctor.fromJson(i)).toList();

    return DoctorList(doctors);
  }
}
