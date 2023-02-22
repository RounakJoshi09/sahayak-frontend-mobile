import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/state_manager_controller.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/confirm_appointment_widget.dart';
import 'package:sahayak_application/utils/widgets/date_picker.dart';
import '../utils/widgets/doctors_card_widget.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

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
        title: const Text("Appointment"),
        backgroundColor: const Color.fromARGB(248, 11, 212, 206),
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              const Text(
                "Doctors",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(160, 85, 88, 88)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoriesWidget(),
                    CategoriesWidget(),
                    CategoriesWidget(),
                    CategoriesWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              const Text(
                "Schedule",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(160, 85, 88, 88)),
              ),
              const DatePickerWidget(),
              SizedBox(
                height: height * 0.02,
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
              Center(
                child: Container(
                  height: height * 0.05,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 236, 237, 237),
                  ),
                  child: GetBuilder(
                    init: StateManagerController(),
                    builder: (controller) {
                      return TextButton(
                          child: Text(_stateManagerController.formatTime, style: TextStyle(fontSize: 15),),
                          onPressed: () async {
                            TimeOfDay? d = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            await _stateManagerController.getSelectedDate(d!);
                          });
                    },
                  ),
                ),
              ),
            ],
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
