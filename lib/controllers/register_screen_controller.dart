import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/States.dart';
import 'package:http/http.dart' as http;
import '../models/City.dart';
import '../utils/connection/APIs.dart';

class RegisterScreenController extends GetxController {
  static RegisterScreenController get registerScreenController => Get.find();

  RxString selectedState = "".obs;
  RxString selectedStateId = "".obs;
  RxString selectedCity = "".obs;
  RxString selectedCityId = "".obs;
  void setState(String state) {
    selectedState.value = state;
  }

  String getState() {
    return selectedState.value;
  }

  void setStateId(String stateId) {
    selectedStateId.value = stateId;
  }

  String getStateId() {
    return selectedStateId.value;
  }

  void setCity(String city) {
    selectedCity.value = city;
  }

  String getCity() {
    return selectedCity.value;
  }

  void setCityId(String cityId) {
    selectedCityId.value = cityId;
  }

  String getCityId() {
    return selectedCityId.value;
  }

  Future<StateList> fetchStates() async {
    try {
      debugPrint(Sahayak.fetchAllState());
      final response = await http.get(
        Uri.parse(Sahayak.fetchAllState()),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint("Here");
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());

        return StateList.fromJson(jsonData['data'] as List<dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<CityList> fetchCity(String stateId) async {
    try {
      debugPrint(Sahayak.fetchAllCities(stateId));
      final response = await http.get(
        Uri.parse(Sahayak.fetchAllCities(stateId)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint("Here");
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());

        return CityList.fromJson(jsonData['data'] as List<dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<String> registerPatient(String firstName, String lastName, String age,
      String email, String mobileNumber, String password) async {
    try {
      var response = await http.post(
        Uri.parse(Sahayak.registerPatient()),
        body: <String, String>{
          "firstName": firstName,
          "lastName": lastName,
          "patientName": firstName + " " + lastName,
          "age": age,
          "email": email,
          "phoneNo": mobileNumber,
          "password": password,
        },
      ).catchError((e) {
        debugPrint(e.toString());
      });

      return response.body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
