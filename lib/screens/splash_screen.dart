import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_application/screens/login_screen.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

import '../utils/data/storage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final Helperfunction _helperfunction = Helperfunction();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      MyStorage.readisLogin == true
          ? Get.off(const NavBarSkeleton())
          : Get.off(LoginScreen());
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getHeight(context);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(248, 11, 212, 206),
          Color.fromARGB(248, 34, 241, 238),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.25,
                width: width * 0.3,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Sahayak",
                style: TextStyle(
                    fontFamily: "Dancing Script",
                    fontSize: 50,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
