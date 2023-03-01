import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';
import 'package:sahayak_application/utils/widgets/history_card_widget.dart';

class PresentAppointmentScreen extends StatelessWidget {
  PresentAppointmentScreen({super.key});
  final Helperfunction _helperfunction = Helperfunction();
  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            // HistoryCardWidget(),
            
          ],
        ),
      ),
    );
  }
}
