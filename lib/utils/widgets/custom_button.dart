// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.title,
    this.color,
    this.onTap,
  });

  final double height;
  final double width;
  final double borderRadius;
  final String title;
  Color? color;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: color,
          gradient: const LinearGradient(
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
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        )),
      ),
    );
  }
}
