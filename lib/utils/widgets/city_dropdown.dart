import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/register_screen_controller.dart';
import 'package:sahayak_application/models/City.dart';
import 'package:sahayak_application/utils/TextStyle.dart';

Widget getCityDropdown(BuildContext context, List<City> cityList) {
  return Obx(
    () => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: [
          DropdownMenuItem<String>(
            value: "Select City",
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Select City",
                style: subtitle2(color: Colors.grey),
              ),
            ),
          ),
          ...cityList.map((item) {
            return DropdownMenuItem<String>(
              value: item.cityName,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  item.cityName.toUpperCase(),
                  style: subtitle2(color: Colors.grey),
                ),
              ),
            );
          }).toList()
        ],
        style: subtitle2(color: Colors.grey),
        onChanged: (value) {
          RegisterScreenController.registerScreenController.setCity(value!);
          RegisterScreenController.registerScreenController
              .setCityId(getCityCode(cityList, value));
        },
        value: RegisterScreenController.registerScreenController.getCity(),
      ),
    ),
  );
}

String getCityCode(List<City> cities, String cityName) {
  String code = "";
  for (var city in cities) {
    if (city.cityName == cityName) {
      code = city.cityId;
      break;
    }
  }
  return code;
}
