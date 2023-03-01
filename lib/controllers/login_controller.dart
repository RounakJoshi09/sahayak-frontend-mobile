import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Response.dart';
import 'package:sahayak_application/utils/connection/APIs.dart';
import 'package:sahayak_application/utils/data/storage.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  var dio = Dio();
  Future<CustomResponse> loginUser(String mobileNo, String password) async {
    try {
      debugPrint(Sahayak.loginPatient());
      Map<String, dynamic> data = {
        "phoneNo": mobileNo,
        "password": password,
      };
      var response = await dio
          .post(
        Sahayak.loginPatient(),
        data: data,
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      )
          .catchError((e) {
        debugPrint(e.toString());
      });
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());

        var jsonData = response.data;
        debugPrint(jsonData.toString());
        MyStorage.setFirstName(jsonData['first_name']);
        MyStorage.setLastName(jsonData['last_name']);
        MyStorage.setFullName(jsonData['first_name'] + jsonData['last_name']);
        MyStorage.setEmail(jsonData['email']);
        MyStorage.setMobileNumber(jsonData['phone_no']);
        MyStorage.setStateId(jsonData['stateId']);
        MyStorage.setCityId(jsonData['cityId']);
        MyStorage.setAge(jsonData['age']);
        MyStorage.setId(jsonData['id']);
        MyStorage.setIsLogin(true);
        return CustomResponse(
            message: "Logged In Successfully", statusCode: 200);
      } else {
        return CustomResponse(
            message: "Something Went Wrong", statusCode: response.statusCode!);
      }
    } catch (e) {
      debugPrint(e.toString());
      // ignore: unnecessary_new
      return CustomResponse(message: "Something Went Wrong", statusCode: 404);
    }
  }
}
