// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sahayak_application/models/Hospital.dart';
import 'package:sahayak_application/screens/hospital_doctors_screen.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

import '../utils/constants.dart';

class HospitalScreen extends StatelessWidget {
  Hospital hospital;
  HospitalScreen(this.hospital, {super.key});

  final Helperfunction _helperfunction = Helperfunction();
  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(248, 11, 212, 206),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: const Color.fromARGB(248, 11, 212, 206),
          child: Stack(
            children: [
              // Positioned(
              //     top: 0,
              //     child: Image.network(
              //         base_url + "/download/${hospital.imageId}")),
              SizedBox(
                height: height * 0.35,
                width: width,
                child: Image.network(
                  "$base_url/download/${hospital.imageId}",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: height * 0.55,
                  width: width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 5,
                            width: 35,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.5)),
                                color: Color.fromARGB(66, 68, 67, 67)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          hospital.hospitalName,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 30, 27, 27),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        // Row(
                        //   children: const [
                        //     Text(
                        //       "4.5",
                        //       style: TextStyle(
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w400,
                        //         color: Color.fromARGB(255, 44, 43, 43),
                        //       ),
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: Color.fromARGB(255, 229, 213, 67),
                        //     )
                        //   ],
                        // ),
                        Text(
                          "Hospital in ${hospital.cityName.toUpperCase()}, ${hospital.stateName.toUpperCase()}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 44, 43, 43),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //         height: height * 0.055,
                        //         width: width * 0.28,
                        //         decoration: const BoxDecoration(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(25)),
                        //           color: Color.fromARGB(248, 34, 241, 238),
                        //         ),
                        //         child: const Center(
                        //             child: Text(
                        //           "Directions",
                        //           style: TextStyle(color: Colors.white),
                        //         ))),
                        //     Container(
                        //         height: height * 0.055,
                        //         width: width * 0.28,
                        //         decoration: const BoxDecoration(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(25)),
                        //           color: Color.fromARGB(248, 34, 241, 238),
                        //         ),
                        //         child: const Center(
                        //             child: Text(
                        //           "Reviews",
                        //           style: TextStyle(color: Colors.white),
                        //         ))),
                        //     Container(
                        //         height: height * 0.055,
                        //         width: width * 0.28,
                        //         decoration: const BoxDecoration(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(25)),
                        //           color: Color.fromARGB(248, 34, 241, 238),
                        //         ),
                        //         child: const Center(
                        //             child: Text(
                        //           "Services",
                        //           style: TextStyle(color: Colors.white),
                        //         ))),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: height * 0.01,
                        // ),
                        Container(
                          height: height * 0.308,
                          width: width,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 240, 241, 241),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                const Text(
                                  "Address :",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(160, 85, 88, 88)),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text(
                                  "${hospital.area} ${hospital.street} ${hospital.cityName} ${hospital.stateName} ",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 63, 63, 63)),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text(
                                  "Description :",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(160, 85, 88, 88)),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text(
                                  hospital.description,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 63, 63, 63)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
        child: GestureDetector(
          onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HospitalsDoctorScreen(
                        hospitalId: hospital.id,
                        hospitalName: hospital.hospitalName,
                      )))),
          child: Container(
            height: height * 0.08,
            width: width * 0.8,
            decoration: const BoxDecoration(
                color: Color.fromARGB(248, 11, 212, 206),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Center(
                child: Text(
              "Get Appointment",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
