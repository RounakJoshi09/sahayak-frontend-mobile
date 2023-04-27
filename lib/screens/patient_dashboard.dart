import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/DashboardController.dart';
import 'package:sahayak_application/models/Appointment.dart';
import 'package:sahayak_application/screens/history_appointment_screen.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/screens/profile_screen.dart';
import 'package:sahayak_application/utils/TextStyle.dart';
import 'package:sahayak_application/utils/network/connection/APIs.dart';
import 'package:sahayak_application/utils/network/data/storage.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';
import 'package:sahayak_application/utils/widgets/history_card_widget.dart';
import 'package:sahayak_application/utils/widgets/hosp_card_widget.dart';
import 'package:sahayak_application/utils/widgets/search_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  final Helperfunction _helperfunction = Helperfunction();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/animated_medium20190927-27720-ks2ink.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(66, 53, 47, 47)),
                      ),
                      Text(
                        MyStorage.readFullName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(222, 49, 47, 47)),
                      )
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Color.fromARGB(255, 131, 163, 193),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProfileScreen())),
                  ),
                  //  CustomContainer(height: 40, width: 40),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const SearchBar(),
              SizedBox(
                height: height * 0.01,
              ),
              Expanded(
                child: ListView(
                  children: [
                    CustomContainer(
                      height: 180,
                      width: 800,
                      widget: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // CustomContainer(
                    //   height: height * 0.15,
                    //   width: width,
                    //   widget: Center(
                    //     child: ElevatedButton(
                    //       child: const Text("Book Now"),
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),

                    FutureBuilder<Appointment?>(
                        future: fetchUpcomingAppointment(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your Next Appointment",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(160, 85, 88, 88)),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              HistoryCardWidget(
                                onTap: () {},
                                appointment: snapshot.data!,
                              ),
                            ],
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hospitals in Your City",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(160, 85, 88, 88)),
                        ),
                        TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => ViewAllWidget()));
                            },
                            child: const Text(
                              "View All",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 154, 239)),
                            ))
                      ],
                    ),
                    GetBuilder<DashboardController>(
                      init: DashboardController(),
                      builder: (controller) {
                        return FutureBuilder(
                          future: controller.fetchHospitalsByCityId(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return GridView.builder(
                              padding: EdgeInsets.zero, // set padding to zero
                              shrinkWrap: true,
                              itemCount: snapshot.data!.hospitalList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return HospCardWidget(
                                    snapshot.data!.hospitalList[index]);
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Appointment?> fetchUpcomingAppointment() async {
    try {
      String patientId = MyStorage.readId;
      debugPrint(Sahayak.upcomingAppointment(patientId));
      final response = await http.get(
        Uri.parse(Sahayak.upcomingAppointment(patientId)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());
        if (jsonData['data'] == null) {
          return null;
        }
        return Appointment.fromJson(jsonData['data']);
      } else {
        //Helperfunction.showToast(jsonDecode(response.body)['message']);
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
