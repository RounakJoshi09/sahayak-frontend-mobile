import 'package:get_storage/get_storage.dart';

class MyStorage {
  static final box = GetStorage();

  static void setFirstName(String firstName) {
    box.write('first_name', firstName);
  }

  static void setLastName(String lastName) {
    box.write('last_name', lastName);
  }

  static void setFullName(String fullName) {
    box.write('full_name', fullName);
  }

  static void setEmail(String email) {
    box.write('email', email);
  }

  static void setMobileNumber(String mobileNumber) {
    box.write('mobile', mobileNumber);
  }

  static void setId(String id) {
    box.write('id', id);
  }

  static void setCityId(String cityId) {
    box.write('city_id', cityId);
  }

  static void setStateId(String stateId) {
    box.write('state_id', stateId);
  }

  static void setIsLogin(bool isLogin) {
    box.write('is_login', isLogin);
  }

  static get readFirstName => box.read('first_name');
  static get readLastName => box.read('last_name');
  static get readEmail => box.read('email');
  static get readMobileNumber => box.read('mobile');
  static get readId => box.read('id');
  static get cityId => box.read('city_id');
  static get readFullName =>
      box.read('first_name') + " " + box.read('last_name');
  static get readisLogin => box.read('is_login');
}
