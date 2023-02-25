// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/register_screen_controller.dart';
import 'package:sahayak_application/utils/TextStyle.dart';
import '../utils/helper/helper_functions.dart';
import '../utils/widgets/city_dropdown.dart';
import '../utils/widgets/custom_button.dart';
import '../utils/widgets/state_dropdown.dart';
import '../utils/widgets/textfield_widget.dart';
import 'navigation_bar_skeleton.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final Helperfunction _helperfunction = Helperfunction();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RegisterScreenController registerScreenController =
      Get.put(RegisterScreenController());

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
                    title: "Your First Name",
                    icon: Icons.person,
                    controller: firstNameController),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                    title: "Your Last Name",
                    icon: Icons.person,
                    controller: lastNameController),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                    title: "Age",
                    icon: Icons.person,
                    controller: ageController),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Select State",
                //   style: subtitle2(color: Colors.black54),
                // ),
                // FutureBuilder(
                //     future: registerScreenController.fetchStates(),
                //     builder: (context, snapshot) {
                //       if (!snapshot.hasData) {
                //         return const Center(child: CircularProgressIndicator());
                //       }
                //       return getStateDropdown(
                //           context, snapshot.data!.stateList);
                //     }),
                // Text(
                //   "Select City",
                //   style: subtitle2(color: Colors.black54),
                // ),
                // Obx(
                //   () => FutureBuilder(
                //       future: registerScreenController
                //           .fetchCity(registerScreenController.getStateId()),
                //       builder: (context, snapshot) {
                //         if (!snapshot.hasData) {
                //           return const Center(
                //               child: CircularProgressIndicator());
                //         }
                //         if (snapshot.data!.cityList.isEmpty) {
                //           return Center(
                //             child: Text(
                //               'City Not Found',
                //               style: subtitle2(color: Colors.grey),
                //             ),
                //           );
                //         }
                //         return getCityDropdown(
                //             context, snapshot.data!.cityList);
                //       }),
                // ),
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
                    controller: phoneNumberController),
                const SizedBox(
                  height: 10,
                ),
                TextfieldWidget(
                    title: "Password",
                    icon: Icons.person,
                    controller: passwordController),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    height: height * 0.07,
                    width: width * 0.45,
                    borderRadius: 8.0,
                    title: "Register",
                    onTap: () async {
                      // String response =
                      //     await registerScreenController.registerPatient(
                      //         firstNameController.text,
                      //         lastNameController.text,
                      //         ageController.text,
                      //         emailController.text,
                      //         phoneNumberController.text,
                      //         passwordController.text);
                      String response = "Tmp";
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBarSkeleton()),
                      );
                      if (response == "Patient registered") {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBarSkeleton()),
                        );
                      } else {
                        Helperfunction.showToast(response);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
