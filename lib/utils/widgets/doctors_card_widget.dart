// ignore_for_file: sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    super.key,
  });

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: height * 0.15,
        width: height * 0.15,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 127, 82, 234),
                // Color.fromARGB(255, 125, 136, 230)
                Color.fromARGB(255, 7, 190, 148),
                Color.fromARGB(255, 60, 209, 174)
                // Color.fromARGB(248, 11, 212, 206),
                // Color.fromARGB(248, 34, 241, 238),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
            ),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              "Dr Dinesh Mehta",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Text(
              "Heart Surgeon",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
