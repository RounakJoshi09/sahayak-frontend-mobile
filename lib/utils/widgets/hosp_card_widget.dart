// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sahayak_application/models/Hospital.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/screens/hospital_screen.dart';

class HospCardWidget extends StatelessWidget {
  Hospital hospital;
  HospCardWidget(this.hospital, {super.key});
  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => HospitalScreen(hospital)));
      },
      child: Container(
        decoration: const BoxDecoration(
            boxShadow: [],
            color: Color.fromARGB(211, 198, 239, 240),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/6634380.jpg",
              height: height * 0.15,
              width: width * 0.4,
              fit: BoxFit.fill,
            ),
            Text(
              hospital.hospitalName,
              style: const TextStyle(
                  color: Color.fromRGBO(61, 60, 60, 0.757),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "${hospital.cityName.toUpperCase()},",
              style: const TextStyle(
                  color: Color.fromRGBO(61, 60, 60, 0.757),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(hospital.stateName.toUpperCase(),
              style: const TextStyle(
                  color: Color.fromRGBO(61, 60, 60, 0.757),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
