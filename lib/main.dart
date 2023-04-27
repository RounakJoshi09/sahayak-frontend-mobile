import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahayak_application/screens/login_screen.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/screens/splash_screen.dart';
import 'package:sahayak_application/utils/network/data/storage.dart';
import 'package:sahayak_application/screens/profile_screen.dart';

void main() async {
  await GetStorage.init();
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SahayakApp());
}

class SahayakApp extends StatelessWidget {
  const SahayakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: MyStorage.readisLogin == true
      //     ? const NavBarSkeleton()
      //     : LoginScreen(),
    );
  }
}
