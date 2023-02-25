import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle heading1({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 26, fontWeight: FontWeight.bold);
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
      color: color, fontSize: 16, fontWeight: FontWeight.w500);
}

TextStyle subtitle2({Color? color}) {
  return GoogleFonts.poppins(
      color: color, fontSize: 14, fontWeight: FontWeight.w500);
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
