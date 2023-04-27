import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/controllers/register_screen_controller.dart';
import 'package:sahayak_application/models/States.dart';
import 'package:sahayak_application/utils/TextStyle.dart';

Widget getStateDropdown(BuildContext context, List<States> stateList) {
  return Obx(
    () => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: [
          DropdownMenuItem<String>(
            value: "Select State",
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Select State",
                style: subtitle2(color: Colors.grey),
              ),
            ),
          ),
          ...stateList.map((item) {
            return DropdownMenuItem<String>(
              value: item.stateName,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  item.stateName.toUpperCase(),
                  style: subtitle2(color: Colors.grey),
                ),
              ),
            );
          }).toList()
        ],
        style: subtitle2(color: Colors.grey),
        onChanged: (value) {
          RegisterScreenController.registerScreenController.setState(value!);
          RegisterScreenController.registerScreenController
              .setStateId(getStateCode(stateList, value));
        },
        value: RegisterScreenController.registerScreenController.getState(),
      ),
    ),
  );
}

String getStateCode(List<States> states, String stateName) {
  String code = "";
  for (var state in states) {
    if (state.stateName == stateName) {
      code = state.stateId;
      break;
    }
  }
  return code;
}
