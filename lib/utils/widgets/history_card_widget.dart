import 'package:flutter/material.dart';
import 'package:sahayak_application/models/Appointment.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';

class HistoryCardWidget extends StatelessWidget {
  final Function? onTap;
  Appointment appointment;
  HistoryCardWidget({super.key, this.onTap, required this.appointment});

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return GestureDetector(
      onTap: () => onTap!(),
      child: CustomContainer(
        height: height * 0.18,
        width: width,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Container(
            //   height: height * 0.15,
            //   width: width * 0.15,
            //   decoration: const BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(12)),
            //       color: Color.fromARGB(255, 35, 143, 231)),
            //   child: const Icon(
            //     Icons.medication_liquid_rounded,
            //     size: 55,
            //     color: Colors.white,
            //   ),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            Container(
              height: height * 0.15,
              width: height * 0.32,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                //color: Color.fromARGB(255, 248, 250, 252)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        "Dr ${appointment.doctorName}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(160, 85, 88, 88)),
                      ),
                    ],
                  ),
                  // Text(
                  //   appointment.doctorEducation,
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w700,
                  //       color: Color.fromARGB(160, 85, 88, 88)),
                  // ),
                  // const SizedBox(
                  //   height: 3,
                  // ),
                  Text(
                    appointment.hospitalName,
                    style: TextStyle(
                        color: Color.fromARGB(159, 24, 39, 244),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    appointment.hospitalAddress.toUpperCase(),
                    style: TextStyle(
                        color: Color.fromARGB(159, 24, 39, 244),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    appointment.appointmentDate,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(159, 24, 39, 244),
                    ),
                  ),

                  Container(
                    width: 150,
                    height: 25,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 236, 237, 237),
                    ),
                    child: Center(
                      child: Text(
                        "${appointment.approximateStartTime} - ${appointment.appointmentEndTime}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Your Turn Time ${appointment.approximateTurnTime}*",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
