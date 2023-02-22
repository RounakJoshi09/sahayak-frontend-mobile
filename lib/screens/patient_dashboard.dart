import 'package:flutter/material.dart';
import 'package:sahayak_application/utils/helper/helper_functions.dart';
import 'package:sahayak_application/utils/widgets/custom_container.dart';
import 'package:sahayak_application/utils/widgets/hosp_card_widget.dart';
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
                height: height * 0.01,
              ),
              CustomContainer(
                height: height * 0.15,
                width: width,
                widget: Center(
                  child: ElevatedButton(
                    child: const Text("Book Now"),
                    onPressed: () {},
                  ),
                ),
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
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => ViewAllWidget()));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 154, 239)),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.235,
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
                    return HospCardWidget();
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
