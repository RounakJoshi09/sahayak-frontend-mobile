// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_button.dart';

Future ShowConfirmation(BuildContext context) async {
  var height = Helperfunction().getHeight(context);
  var width = Helperfunction().getWidth(context);
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
                  const Text(
                    "Your appointment with Dr. Dinesh Mehta is confirmed.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 123, 121, 121)),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 9, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Booking ID",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 107, 107)),
                        ),
                        Text(
                          "#A806513",
                          style: TextStyle(
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
                      children: const [
                        Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 107, 107)),
                        ),
                        Text(
                          "15 Feb,2022 Monday",
                          style: TextStyle(
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
                      children: const [
                        Text(
                          "Time",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 107, 107)),
                        ),
                        Text(
                          "12:00 AM",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 23, 22, 22)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomButton(
                    height: height * 0.05,
                    width: width * 0.25,
                    borderRadius: 6,
                    title: "Done",
                    color: const Color.fromARGB(248, 11, 212, 206),
                    onTap: () => Navigator.pop(context),
                  )
                ],
              ),
            );
          }),
        );
      },
      context: context);
}
