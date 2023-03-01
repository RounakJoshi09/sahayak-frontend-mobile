import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahayak_application/controllers/login_controller.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: IntlPhoneField(
        controller: LoginController.loginController.phoneNumberController,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(borderSide: BorderSide(), gapPadding: 6.0),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onTap: () =>
            {print(LoginController.loginController.phoneNumberController.text)},
        showDropdownIcon: false,
      ),
    );
  }
}
