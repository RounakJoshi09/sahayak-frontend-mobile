// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../utils/helper/helper_functions.dart';
import '../utils/widgets/custom_button.dart';
import '../utils/widgets/state_dropdown.dart';
import '../utils/widgets/textfield_widget.dart';
import 'navigation_bar_skeleton.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final Helperfunction _helperfunction = Helperfunction();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.06),
                const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextfieldWidget(
                    title: "Your Name",
                    icon: Icons.person,
                    controller: usernameController),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                    title: "Age",
                    icon: Icons.person,
                    controller: emailController),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                getStateDropdown(context),
                TextfieldWidget(
                    title: "Email",
                    icon: Icons.email,
                    controller: emailController),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                    title: "Mobile Number",
                    icon: Icons.phone,
                    controller: emailController),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                    title: "Username",
                    icon: Icons.person,
                    controller: emailController),
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
                  title: "Register",
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavBarSkeleton())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
