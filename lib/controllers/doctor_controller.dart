import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Doctor.dart';
import 'package:http/http.dart' as http;
import '../utils/connection/APIs.dart';

class DoctorController {
  Future<DoctorList> fetchHospitalDoctors(String hospitalId) async {
    try {
      debugPrint(Sahayak.getDoctorByHospitalId(hospitalId));
      final response = await http.get(
        Uri.parse(Sahayak.getDoctorByHospitalId(hospitalId)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());

        return DoctorList.fromJson(jsonData['data'] as List<dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
