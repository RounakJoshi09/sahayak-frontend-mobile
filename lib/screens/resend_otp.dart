import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahayak_application/controllers/login_controller.dart';

class ResendOtp extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  ResendOtp();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () async {
            print(LoginController.loginController.phoneNumberController.text);
            await (_auth).verifyPhoneNumber(
              phoneNumber:
                  '+91${LoginController.loginController.phoneNumberController.text}',
              timeout: const Duration(seconds: 30),
              verificationCompleted: (PhoneAuthCredential) async {},
              verificationFailed: (verificationFailed) async {},
              codeSent: (verificationId, resendingToken) async {
                // global.verificationId = verificationId;
                // print(global.verificationId);
                LoginController.loginController.verificationId = verificationId;
                LoginController.loginController.changeToOTPState();
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text('Request Again')),
    );
  }
}
