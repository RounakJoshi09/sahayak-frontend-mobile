import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/state_manager_controller.dart';
import 'package:sahayak_application/models/TimeSlot.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/calender_widget.dart';
import 'package:sahayak_application/utils/widgets/confirm_appointment_widget.dart';
import 'package:sahayak_application/utils/widgets/date_picker.dart';
import '../models/Doctor.dart';
import '../utils/TextStyle.dart';
import '../utils/widgets/doctors_card_widget.dart';

class AppointmentScreen extends StatelessWidget {
  Doctor doctor;
  AppointmentScreen(this.doctor);

  final Helperfunction _helperfunction = Helperfunction();
  final StateManagerController _stateManagerController =
      Get.put(StateManagerController());
  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Appointment For Dr. ${doctor.firstName}"),
        backgroundColor: const Color.fromARGB(248, 11, 212, 206),
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                // const Text(
                //   "Doctors",
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w700,
                //       color: Color.fromARGB(160, 85, 88, 88)),
                // ),
                // SizedBox(
                //   height: height * 0.015,
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       DocCardWidget(),
                //       DocCardWidget(),
                //       DocCardWidget(),
                //       DocCardWidget(),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: height * 0.02,
                // ),
                const Text(
                  "Doctors Schedule",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(160, 85, 88, 88)),
                ),
                FutureBuilder(
                  future: StateManagerController.stateManagerController
                      .fetchLeaveDays(doctor.id),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CalendarPage2(
                        absentDates: snapshot.data!.leaveDates);
                  },
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                const Text(
                  "Time Slot",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(160, 85, 88, 88)),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                // Center(
                //   child: Container(
                //     height: height * 0.05,
                //     width: width * 0.8,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: const Color.fromARGB(255, 236, 237, 237),
                //     ),
                //     child: Container(
                //         width: width * 0.8,
                //         child: ListView.builder(
                //             itemCount: 1,
                //             itemBuilder: (context, index) {
                //               return const ListTile(
                //                 title: Text("10:00 - 11:00 Am"),
                //               );
                //             })),

                //   ),
                // ),
                GetBuilder(
                  init: StateManagerController(),
                  builder: (controller) {
                    return Center(
                      child: Container(
                          width: width * 0.8,
                          height: height * 0.3,
                          child: FutureBuilder<TimeSlotList>(
                              future: controller.fetchTimeSlotByDoctorIdAndDate(
                                  doctor.id, controller.appointmentDate.value),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.data!.timeSlotList.isEmpty) {
                                  return const Center(
                                      child: Text(
                                          'Appointment Time Slots Not Found'));
                                }
                                return ListView.builder(
                                    itemCount:
                                        snapshot.data!.timeSlotList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      TimeSlot timeSlot =
                                          snapshot.data!.timeSlotList[index];
                                      return
                                          // controller.timeSlotsCount == 1
                                          //     ?
                                          Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: width * 0.8,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              color: Color.fromARGB(
                                                  255, 236, 237, 237),
                                            ),
                                            child: TextButton(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${timeSlot.slotStart} - ${timeSlot.slotEnd}",
                                                      style: subtitle1(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${timeSlot.totalAppointmentsAllowed} Appointment Allowed",
                                                      style: subtitle1(
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () async {
                                                  await controller
                                                      .getTimeSlots();
                                                })),
                                      );
                                      // : const ListTile(
                                      //     title: Center(
                                      //         child:
                                      //             Text("10:00 - 11:00 Am")),
                                      //     tileColor: Color.fromARGB(
                                      //         255, 236, 237, 237),
                                      //   );
                                    });
                              })),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
        child: GestureDetector(
          onTap: (() => ShowConfirmation(context)),
          child: Container(
            height: height * 0.08,
            width: width * 0.8,
            decoration: const BoxDecoration(
                color: Color.fromARGB(248, 11, 212, 206),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: const Center(
                child: Text(
              "Confirm Appointment",
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
