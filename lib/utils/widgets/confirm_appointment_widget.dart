// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/state_manager_controller.dart';
import 'package:sahayak_application/models/Doctor.dart';
import 'package:sahayak_application/screens/history_appointment_screen.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/screens/patient_dashboard.dart';
import 'package:sahayak_application/utils/TextStyle.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_button.dart';
import 'package:intl/intl.dart';

Future ShowConfirmation(BuildContext context, Doctor doctor) async {
  var height = Helperfunction().getHeight(context);
  var width = Helperfunction().getWidth(context);
  DateTime appointmentDate =
      StateManagerController.stateManagerController.appointmentDate.value;
  showDialog(
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          content: Builder(builder: (context) {
            return SizedBox(
              height: height * 0.5,
              width: width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.task_alt_outlined,
                    size: 95,
                    color: Color.fromARGB(255, 108, 233, 112),
                  ),
                  const Text(
                    "Confirmation",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Your appointment with Dr. ${doctor.fullName} is confirmed.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 123, 121, 121)),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 9.0, bottom: 9, left: 8, right: 8),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: const [
                  //       Text(
                  //         "Booking ID",
                  //         style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color.fromARGB(255, 108, 107, 107)),
                  //       ),
                  //       Text(
                  //         "#A806513",
                  //         style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color.fromARGB(255, 23, 22, 22)),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 0.9,
                    width: 800,
                    color: const Color.fromARGB(255, 135, 135, 135),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 9, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 107, 107)),
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .format(
                                  DateTime.parse(appointmentDate.toString()))
                              .toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 22, 22)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 0.9,
                    width: 800,
                    color: const Color.fromARGB(255, 135, 135, 135),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 9, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "From",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 107, 107)),
                        ),
                        Text(
                          StateManagerController
                              .stateManagerController.selectedSlotStart
                              .toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 22, 22)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 0.9,
                    width: 800,
                    color: const Color.fromARGB(255, 135, 135, 135),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 9, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "To",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 107, 107)),
                        ),
                        Text(
                          StateManagerController
                              .stateManagerController.selectedSlotEnd
                              .toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 22, 22)),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Your Turn Time : ${StateManagerController.stateManagerController.approximateTurnTime}*",
                    style: subtitle1(color: Colors.green),
                  ),
                  CustomButton(
                      height: height * 0.03,
                      width: width * 0.33,
                      borderRadius: 6,
                      title: "Check Status",
                      color: const Color.fromARGB(248, 11, 212, 206),
                      onTap: () {
                        Get.offAll(const NavBarSkeleton(getIndex: 1,));
                        //Navigator.pop(context);
                      }),
                  Text(
                    "*Your Turn Time is approximate and depends on various factors, therefore we request you to reach the hospital 15 minutes before your turn time",
                    style: subtitle5(color: Colors.grey),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            );
          }),
        );
      },
      context: context);
}

enum _SelectedTab { home, appointment, reminder, profile }
