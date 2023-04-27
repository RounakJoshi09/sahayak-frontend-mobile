// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/login_controller.dart';
import 'package:sahayak_application/controllers/register_screen_controller.dart';
import 'package:sahayak_application/screens/login_screen.dart';
import 'package:sahayak_application/utils/TextStyle.dart';
import 'package:sahayak_application/utils/widgets/city_dropdown.dart';
import 'package:sahayak_application/utils/widgets/phone_number_field.dart';
import 'package:sahayak_application/utils/widgets/state_dropdown.dart';
import '../utils/helper/helper_functions.dart';
import '../utils/widgets/custom_button.dart';
import '../utils/widgets/textfield_widget.dart';
import 'navigation_bar_skeleton.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GetBuilder<RegisterScreenController>(
              init: RegisterScreenController(),
              builder: (registerScreenController) {
                return SingleChildScrollView(
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
                          controller:
                              registerScreenController.firstNameController),
                      const SizedBox(
                        height: 10,
                      ),
                      TextfieldWidget(
                          title: "Your Last Name",
                          icon: Icons.person,
                          controller:
                              registerScreenController.lastNameController),
                      const SizedBox(
                        height: 10,
                      ),
                      TextfieldWidget(
                          title: "Age",
                          icon: Icons.person,
                          controller: registerScreenController.ageController),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Select State",
                        style: subtitle2(color: Colors.black54),
                      ),
                      FutureBuilder(
                          future: registerScreenController.fetchStates(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getStateDropdown(
                                    context, snapshot.data!.stateList),
                                Text(
                                  "Select City",
                                  style: subtitle2(color: Colors.black54),
                                ),
                                Obx(
                                  () => FutureBuilder(
                                      future: registerScreenController
                                          .fetchCity(registerScreenController
                                              .selectedStateId.value),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Container();
                                        }
                                        if (snapshot.data!.cityList.isEmpty) {
                                          return Center(
                                            child: Text(
                                              'City Not Found',
                                              style:
                                                  subtitle2(color: Colors.grey),
                                            ),
                                          );
                                        }
                                        return getCityDropdown(
                                            context, snapshot.data!.cityList);
                                      }),
                                ),
                              ],
                            );
                          }),
                      TextfieldWidget(
                          title: "Email",
                          icon: Icons.email,
                          controller: registerScreenController.emailController),
                      const SizedBox(
                        height: 10,
                      ),
                      PhoneNumberField(enabled: false),
                      const SizedBox(
                        height: 10,
                      ),
                      TextfieldWidget(
                        title: "Password",
                        icon: Icons.key,
                        controller: registerScreenController.passwordController,
                        isObscure: true,
                        showSuffixIcon: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          height: height * 0.07,
                          width: width * 0.45,
                          borderRadius: 8.0,
                          title: "Register",
                          onTap: () async {
                            if (registerScreenController
                                .firstNameController.text.isEmpty) {
                              Helperfunction.showToast("Enter Your First Name");
                              return;
                            }
                            if (registerScreenController
                                .lastNameController.text.isEmpty) {
                              Helperfunction.showToast("Enter Your Last Name");
                              return;
                            }

                            if (registerScreenController
                                .ageController.text.isEmpty) {
                              Helperfunction.showToast("Enter Your Age");
                              return;
                            }
                            if (registerScreenController
                                .passwordController.text.isEmpty) {
                              Helperfunction.showToast("Enter your Password");
                              return;
                            }
                            if (registerScreenController
                                    .selectedStateId.value ==
                                "Select State") {
                              Helperfunction.showToast("Select State and City");
                              return;
                            }

                            String response =
                                await registerScreenController.registerPatient(
                                    registerScreenController
                                        .firstNameController.text,
                                    registerScreenController
                                        .lastNameController.text,
                                    registerScreenController.ageController.text,
                                    registerScreenController
                                        .emailController.text,
                                    LoginController.loginController
                                        .phoneNumberController.text,
                                    registerScreenController
                                        .passwordController.text);
                            Helperfunction.showToast(response);
                            Get.offAll(LoginScreen());
                          }),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
