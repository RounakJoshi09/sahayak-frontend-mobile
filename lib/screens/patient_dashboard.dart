import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/categories_widget.dart';
import 'package:sahayak_application/utils/widgets/custom_button.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';
import 'package:sahayak_application/utils/widgets/search_bar.dart';
import 'package:video_player/video_player.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  final Helperfunction _helperfunction = Helperfunction();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/animated_medium20190927-27720-ks2ink.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    var height = _helperfunction.getHeight(context);
    var width = _helperfunction.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(66, 53, 47, 47)),
                      ),
                      Text(
                        "Jacob James",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(222, 49, 47, 47)),
                      )
                    ],
                  ),
                  CustomContainer(height: 40, width: 40),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const SearchBar(),
              SizedBox(
                height: height * 0.01,
              ),
              CustomContainer(
                  height: 180,
                  width: 800,
                  widget: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(160, 85, 88, 88)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 154, 239)),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoriesWidget(
                    icon: Icons.heart_broken,
                    title: "Cardiology",
                  ),
                  CategoriesWidget(
                    icon: Icons.psychology,
                    title: "psychology",
                  ),
                  CategoriesWidget(
                    icon: Icons.coronavirus,
                    title: "Neurology",
                  ),
                  CategoriesWidget(
                    icon: Icons.elderly,
                    title: "Orthopaedic",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hospitals",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(160, 85, 88, 88)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 154, 239)),
                      ))
                ],
              ),
              Container(
                height: 180,
                child: GridView.builder(
                  padding: EdgeInsets.zero, // set padding to zero
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: const BoxDecoration(
                            boxShadow: [],
                            color: Color.fromARGB(211, 198, 239, 240),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
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
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
