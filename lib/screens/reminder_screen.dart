import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';

class ReminderScreen extends StatelessWidget {
  ReminderScreen({super.key});

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Reminders"),
        backgroundColor: const Color.fromARGB(248, 11, 212, 206),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "10/03/2023",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(160, 85, 88, 88)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 1,
                    child: Container(
                      height: height * 0.11,
                      width: width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(248, 11, 212, 206),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 33,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Sanjeevni Hospital",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(226, 7, 7, 7)),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    "9:33 Am",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                width: width * 0.7,
                                child: const Text(
                                  "Your appointment is scheduled at 10:00 am with Dr. Dinesh. Please reach on time.",
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
