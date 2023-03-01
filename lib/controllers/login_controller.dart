import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Response.dart';
import 'package:sahayak_application/utils/connection/APIs.dart';
import 'package:sahayak_application/utils/data/storage.dart';
import 'package:dio/dio.dart';

enum MobileVerificationState {
  ENTER_MOBILE_NUMBER_STATE,
  ENTER_OTP_STATE,
}

class LoginController extends GetxController {
  static LoginController get loginController => Get.find();
  Rx<MobileVerificationState> currentState =
      MobileVerificationState.ENTER_MOBILE_NUMBER_STATE.obs;
  RxBool showLoading = false.obs;
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final registrationPhoneNumberController =
      TextEditingController(); //For taking input from the field
  final otpController =
      TextEditingController(); //For taking input from the field
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  String verificationId = "";

  var dio = Dio();
  void setVerificationId(String id) {
    verificationId = id;
  }

  void showLoadingState() {
    showLoading = true.obs;
  }

  void notShowLoadingState() {
    showLoading = false.obs;
  }

  void changeToOTPState() {
    currentState.value = MobileVerificationState.ENTER_OTP_STATE;
    update();
  }

  void changeToPhoneState() {
    currentState = MobileVerificationState.ENTER_MOBILE_NUMBER_STATE.obs;
  }

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
