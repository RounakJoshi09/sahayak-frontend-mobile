// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/models/Hospital.dart';
import 'package:http/http.dart' as http;
import 'package:sahayak_application/utils/data/storage.dart';
import '../utils/connection/APIs.dart';

class DashboardController extends GetxController {
  late String cityId;
  @override
  void onInit() {
    cityId = MyStorage.cityId;
    super.onInit();
  }

  DashboardController get dashboardController =>
      Get.find<DashboardController>();
  Future<HospitalList> fetchHospitalsByCityId() async {
    try {
      debugPrint(Sahayak.getHospitalByCityId(cityId));
      final response = await http.get(
        Uri.parse(Sahayak.getHospitalByCityId(cityId)),
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint("Here");
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());

        return HospitalList.fromJson(jsonData['data'] as List<dynamic>);
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
