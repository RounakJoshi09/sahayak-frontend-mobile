import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/screens/hospital_screen.dart';

class HospCardWidget extends StatelessWidget {
  HospCardWidget({super.key});

  final Helperfunction _helperfunction = Helperfunction();

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HospitalScreen()));
      },
      child: Container(
          decoration: const BoxDecoration(
              boxShadow: [],
              color: Color.fromARGB(211, 198, 239, 240),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/6634380.jpg",
                height: height * 0.15,
                width: width * 0.4,
                fit: BoxFit.fill,
              ),
              const Text(
                "Ruby Hall Clinic",
                style: TextStyle(
                    color: Color.fromRGBO(61, 60, 60, 0.757),
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 242, 224, 58),
                    size: 20,
                  ),
                  Text("5.0"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("(25 reviews)"),
                ],
              )
            ],
          )),
    );
  }
}
