// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle heading1({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 22, fontWeight: FontWeight.w800);
}

TextStyle heading2({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 26, fontWeight: FontWeight.w600);
}

TextStyle buttonText({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 18, fontWeight: FontWeight.w600);
}

TextStyle subtitle1({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 14, fontWeight: FontWeight.w600);
}

TextStyle subtitle2({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 12, fontWeight: FontWeight.w400);
}

TextStyle subtitle2Bold({Color? color}) {
  return GoogleFonts.roboto(
      color: color, fontSize: 13, fontWeight: FontWeight.bold);
}

TextStyle subtitle3({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 8, fontWeight: FontWeight.w500);
}

TextStyle appBarText({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 22, fontWeight: FontWeight.w500);
}

TextStyle appBarLogoText({Color? color}) {
  return GoogleFonts.reemKufi(
      color: color, fontSize: 14, fontWeight: FontWeight.w400);
}

TextStyle subtitle5({Color? color}) {
  return GoogleFonts.reemKufi(
      color: color, fontSize: 10, fontWeight: FontWeight.w400);
}
