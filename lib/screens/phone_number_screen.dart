import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahayak_application/controllers/login_controller.dart';
import '../utils/widgets/phone_number_field.dart';
import 'resend_otp.dart';

class PhoneNumberScreen extends StatelessWidget {
  //final TextEditingController phoneNumberController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneNumberField(),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: MaterialButton(
            color: Color.fromRGBO(46, 59, 98, 1),
            textColor: Colors.white,
            onPressed: () async {
//              showLoadingState();

              print(LoginController.loginController.phoneNumberController.text);

              await (_auth).verifyPhoneNumber(
                phoneNumber:
                    '+91${LoginController.loginController.phoneNumberController.text}',
                timeout: const Duration(seconds: 30),
                verificationCompleted: (PhoneAuthCredential) async {
                  //                notShowLoadingState();
                },
                verificationFailed: (verificationFailed) async {
                  //              notShowLoadingState();
                },
                codeSent: (verificationId, resendingToken) async {
                  LoginController.loginController
                      .setVerificationId(verificationId);
                  LoginController.loginController.changeToOTPState();
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text('CONTINUE',
                  textScaleFactor: 1.5,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ],
    );
  }
}
