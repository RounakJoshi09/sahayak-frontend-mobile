import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/profile_card_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: const Color.fromARGB(248, 11, 212, 206),
          elevation: 1,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                ProfileCard(
                  title: "About Us",
                  icon: Icons.person_outline_rounded,
                  onTap: () {},
                ),
                ProfileCard(
                  title: "My Account",
                  icon: Icons.person_outline_rounded,
                  onTap: () {},
                ),
                ProfileCard(
                  title: "Appointment History",
                  icon: Icons.book_outlined,
                  onTap: () {
                    Get.offAll(const NavBarSkeleton(getIndex: 1,));
                  },
                ),
                ProfileCard(
                  title: "Settings",
                  icon: Icons.settings_outlined,
                  onTap: () {},
                ),
                ProfileCard(
                  title: "Log Out",
                  icon: Icons.logout_outlined,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "Log Out?",
                      desc: "Do you want to LogOut?",
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
                  },
                ),
              ],
            )));
  }
}

enum _SelectedTab { home, appointment, reminder, profile }

