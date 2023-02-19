import 'package:flutter/material.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_button.dart';
import 'package:sahayak_application/utils/widgets/textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final Helperfunction _helperfunction = Helperfunction();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                title: "Email", icon: Icons.email, controller: emailController),
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
              height: height * 0.08,
              width: width * 0.45,
              borderRadius: 8.0,
              title: "Login",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NavBarSkeleton())),
            ),
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
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NavBarSkeleton())),
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
