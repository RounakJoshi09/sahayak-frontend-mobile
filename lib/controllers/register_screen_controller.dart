// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/States.dart';
import 'package:http/http.dart' as http;
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import '../models/City.dart';
import '../utils/network/connection/APIs.dart';

class RegisterScreenController extends GetxController {
  static RegisterScreenController get registerScreenController => Get.find();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxString selectedState = "Select State".obs;
  RxString selectedStateId = "Select State".obs;
  RxString selectedCity = "Select City".obs;
  RxString selectedCityId = "Select City".obs;
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
      Map<String, dynamic> data = {
        "firstName": firstName,
        "lastName": lastName,
        "patientName": "$firstName $lastName",
        "age": age,
        "email": email,
        "phoneNo": mobileNumber,
        "password": password,
        "cityId": selectedCityId.value,
        "stateId": selectedStateId.value
      };
      print(data);
      var dio = Dio();
      var response = await dio
          .post(
        Sahayak.registerPatient(),
        data: data,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      )
          .catchError((e) {
        Helperfunction.showToast("Something Went Wrong");
        debugPrint(e.toString());
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = response.data;
        return data['message'];
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
