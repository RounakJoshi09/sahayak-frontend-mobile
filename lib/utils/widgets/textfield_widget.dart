import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({super.key, required this.title, required this.icon, required this.controller});
  final String title;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(220, 228, 230, 234),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(220, 228, 230, 234), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: title,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
