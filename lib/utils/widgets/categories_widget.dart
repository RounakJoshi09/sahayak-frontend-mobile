// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Container(
      height: height * 0.1,
      width: height * 0.1,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 127, 82, 234),
              Color.fromARGB(255, 125, 136, 230)
              // Color.fromARGB(255, 7, 190, 148),
              // Color.fromARGB(255, 60, 209, 174)
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 27,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
    );
  }
}
