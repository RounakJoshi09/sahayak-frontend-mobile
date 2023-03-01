import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../widgets/phone_number.dart';
// import '../widgets/otp_page.dart';
// import '../global.dart' as global;
import 'package:google_fonts/google_fonts.dart';
import 'package:sahayak_application/controllers/login_controller.dart';
import 'package:sahayak_application/screens/phone_number_screen.dart';

import 'otp_page.dart';

class PhoneVerification extends StatefulWidget {
  PhoneVerification({Key? key}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  enterMobileNumberWidget(context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 5),
              margin: EdgeInsets.only(top: 250, left: 5, right: 5, bottom: 2),
              child: Text('Please Enter Your Mobile Number',
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ))),
          Container(
            width: 180,
            padding: const EdgeInsets.only(bottom: 15),
            child: const Text('You\'ll receive a 6 digit code to verify next',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ),
          PhoneNumberScreen(),
        ],
      ),
    );
  }

  enterOTPWidget(context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 250, left: 5, right: 5, bottom: 5),
              child: Text(
                'Verify Phone',
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              )),
          Container(
            width: 180,
            margin: EdgeInsets.only(top: 5, bottom: 0),
            child: Text(
                'Code is sent to ${LoginController.loginController.phoneNumberController.text}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ),
          OTPPage(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Container(
        child: LoginController.loginController.showLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : LoginController.loginController.currentState.value ==
                    MobileVerificationState.ENTER_MOBILE_NUMBER_STATE
                ? enterMobileNumberWidget(context)
                : enterOTPWidget(context),
      ),
    ));
  }
}
