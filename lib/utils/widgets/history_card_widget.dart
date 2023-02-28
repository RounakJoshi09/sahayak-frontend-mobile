import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';

class HistoryCardWidget extends StatelessWidget {
  HistoryCardWidget({super.key, this.onTap});
  final Function? onTap;

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return GestureDetector(
      onTap: () => onTap!(),
      child: CustomContainer(
        height: height * 0.18,
        width: width,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height * 0.15,
              width: height * 0.12,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 35, 143, 231)),
              child: const Icon(
                Icons.medication_liquid_rounded,
                size: 55,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: height * 0.15,
              width: height * 0.32,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                //color: Color.fromARGB(255, 248, 250, 252)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Dr Dinesh Kute",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(160, 85, 88, 88)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(MBBS)",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(160, 85, 88, 88)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "Ruby Hall Clinic, Pune",
                    style: TextStyle(
                        color: Color.fromARGB(159, 24, 39, 244),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "22/12/2023, Monday",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(159, 24, 39, 244),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 150,
                    height: 25,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 236, 237, 237),
                    ),
                    child: const Center(
                      child: Text(
                        "10: 00 - 11: 00 AM",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
