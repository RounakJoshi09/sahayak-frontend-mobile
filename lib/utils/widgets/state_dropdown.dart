import 'package:flutter/material.dart';

Widget getStateDropdown(
  BuildContext context,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
    child: DropdownButton(
      elevation: 0,
      isExpanded: true,
      items: subjectList.map((item) {
        return DropdownMenuItem<String>(
          value: item.subjectName,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10),
            child: Text(
              item.subjectName,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        );
      }).toList(),
      style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15.0),
      onChanged: (value) {},
      value: _selectedSubject,
    ),
  );
}
