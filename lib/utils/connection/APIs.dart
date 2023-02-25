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
}
