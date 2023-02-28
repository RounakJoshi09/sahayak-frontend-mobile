import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahayak_application/screens/login_screen.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/screens/profile_screen.dart';
import 'package:sahayak_application/utils/data/storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const SahayakApp());
}

class SahayakApp extends StatelessWidget {
  const SahayakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home:  ProfileScreen(),
      home: MyStorage.readisLogin == true
          ? const NavBarSkeleton()
          : LoginScreen(),
    );
  }
}
