import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahayak_application/controllers/login_controller.dart';
import 'package:sahayak_application/screens/register_screen.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'resend_otp.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPPage extends StatelessWidget {
  @override
  final otpController = OtpFieldController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    void signInWithPhoneAuthCredential(
        PhoneAuthCredential phoneAuthCredential) async {
      try {
        final authCredential =
            await _auth.signInWithCredential(phoneAuthCredential);

        if (authCredential.user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        } else {
          Helperfunction.showToast("Incorrect OTP");
        }
      } on FirebaseAuthException catch (e) {
        Helperfunction.showToast("Incorrect OTP/Something Went Wrong");
      }
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      child: Column(
        children: [
          OTPTextField(
            length: 6,
            controller: otpController,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 40,
            fieldStyle: FieldStyle.box,
            style: TextStyle(fontSize: 20),
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: Color.fromARGB(66, 14, 153, 247),
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            onCompleted: (pin) async {
              print(pin);
              print(LoginController.loginController.verificationId);
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId:
                          LoginController.loginController.verificationId,
                      smsCode: pin);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Didn\'t recieve code? '),
              ResendOtp(),
            ],
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: MaterialButton(
              color: Color.fromARGB(248, 11, 212, 206),
              textColor: Colors.white,
              onPressed: () async {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  'VERIFY & CONTINUE',
                  textScaleFactor: 1.5,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
