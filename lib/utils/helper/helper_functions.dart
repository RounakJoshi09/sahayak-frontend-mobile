import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahayak_application/models/Response.dart';
import 'package:sahayak_application/utils/network/data/storage.dart';

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
      backgroundColor: const Color.fromARGB(255, 255, 190, 0),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  static String getDateString(DateTime date) {
    String dateString = "";
    dateString += "${date.year}-";
    if (date.month < 10) {
      dateString += "0${date.month}-";
    } else {
      dateString += "${date.month}-";
    }

    if (date.day < 10) {
      dateString += "0${date.day}";
    } else {
      dateString += "${date.day}";
    }

    return dateString;
  }

  static String getDateStringToPrint(DateTime date) {
    String dateString = "";

    if (date.day < 10) {
      dateString += "0${date.day}-";
    } else {
      dateString += "${date.day}-";
    }
    if (date.month < 10) {
      dateString += "0${date.month}-";
    } else {
      dateString += "${date.month}-";
    }
    dateString += "${date.year}";

    return dateString;
  }

  Future<CustomResponse> logout() async {
    MyStorage.eraseAll();
    return CustomResponse(message: "Logged Out Successfully", statusCode: 200);
  }
}
