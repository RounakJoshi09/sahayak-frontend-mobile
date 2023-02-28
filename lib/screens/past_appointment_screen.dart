import 'package:flutter/material.dart';
import '../utils/helper/helper_functions.dart';
import '../utils/widgets/history_card_widget.dart';

class PastAppointmentScreen extends StatelessWidget {
  PastAppointmentScreen({super.key});
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
              height: height * 0.01,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return HistoryCardWidget();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
