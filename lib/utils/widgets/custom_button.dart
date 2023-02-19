// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.color,
    this.onTap,
  });

  final double height;
  final double width;
  final double borderRadius;
  final Color color;
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
        ),
      ),
    );
  }
}
