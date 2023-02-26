import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key, required this.title, required this.icon, required this.onTap});
  final String title;
  final IconData icon;
  final Function onTap;

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 1,
        child: Container(
          width: width,
          height: height * 0.08,
          decoration: const BoxDecoration(
              color: Color.fromARGB(95, 252, 248, 248),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Container(
                  width: width * 0.2,
                  height: height * 0.08,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(248, 11, 212, 206),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
