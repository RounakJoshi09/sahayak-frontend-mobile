// ignore_for_file: must_be_immutable, equal_elements_in_set, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/login_controller.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/screens/register_screen.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_button.dart';
import 'package:sahayak_application/utils/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final Helperfunction _helperfunction = Helperfunction();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: 30,
            ),
            TextfieldWidget(
                title: "Phone", icon: Icons.phone, controller: phoneController),
            const SizedBox(
              height: 10,
            ),
            TextfieldWidget(
                title: "Password",
                icon: Icons.key,
                controller: passwordController),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                height: height * 0.07,
                width: width * 0.45,
                borderRadius: 8.0,
                title: "Login",
                onTap: () async {
                  var response = await loginController.loginUser(
                      phoneController.text, passwordController.text);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const NavBarSkeleton(),
                  //   ),
                  // );
                  if (response.statusCode == 200) {
                    Helperfunction.showToast(response.message);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBarSkeleton(),
                      ),
                    );
                  } else {
                    Helperfunction.showToast(response.message);
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen())),
                    child: const Text(
                      "Register Here",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
