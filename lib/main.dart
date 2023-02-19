import 'package:flutter/material.dart';
import 'package:sahayak_application/screens/navigation_bar_skeleton.dart';

void main() {
  runApp(const SahayakApp());
}

class SahayakApp extends StatelessWidget {
  const SahayakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarSkeleton(),
    );
  }
}
