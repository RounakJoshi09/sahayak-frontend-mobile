// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key, required this.height, required this.width, this.widget});
  final double height;
  final double width;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: widget,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          colors: [
            // Color.fromARGB(255, 25, 10, 233),
            // Color.fromARGB(255, 66, 78, 241)
            // Color.fromARGB(255, 7, 190, 148),
            // Color.fromARGB(255, 60, 209, 174)
            Color.fromARGB(248, 11, 212, 206),
            Color.fromARGB(248, 34, 241, 238),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}
