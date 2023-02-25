import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helperfunction {
  double getHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  double getWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 255, 190, 0),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}
