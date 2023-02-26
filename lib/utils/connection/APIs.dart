import '../constants.dart';

class Sahayak {
  static String fetchAllState() {
    return "$base_url/state";
  }

  static String fetchAllCities(String stateId) {
    return "$base_url/city/$stateId";
  }

  static String registerPatient() {
    return "$base_url/api/patient/addPatient";
  }

  static String loginPatient() {
    return "$base_url/api/patient/login";
  }

  static String getHospitalByCityId(String cityId) {
    return "$base_url/api/hospital/cityHospital?city_id=$cityId";
  }

  static String getDoctorByHospitalId(String hospitalId) {
    return "$base_url/hospitalDoctor/$hospitalId";
  }

  static String getDoctorsSchedule(String doctorId) {
    return "$base_url/doctorSchedule/$doctorId";
  }

  static String getDoctorsTimeSlot(String doctorId, String date) {
    return "$base_url/doctorTimeSlot?doctor_id=$doctorId&date=$date";
  }
}
