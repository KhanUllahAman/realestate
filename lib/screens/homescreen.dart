import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateproject/screens/mainhome.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatelessWidget {
  final RxBool isFinished = false.obs; // RxBool for managing the finished state

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 330,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/images/2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 32.0,
                  color: Colors.black),
              children: const <TextSpan>[
                TextSpan(text: 'Find Your '),
                TextSpan(
                  text: 'Dream',
                  style: TextStyle(color: Color(0xff2c76f8)),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 32.0,
                  color: Colors.black),
              children: const <TextSpan>[
                TextSpan(
                  text: 'Home',
                  style: TextStyle(color: Color(0xff2c76f8)),
                ),
                TextSpan(text: ': Browse Our'),
              ],
            ),
          ),
          Text(
            "Listings Now",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 35.0,
                color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
              "Effortlessly Find Your Perfect Home Discover\n    Compare, and Save Properties with Ease"),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.security_safe,
              ),
              SizedBox(
                width: 10,
              ),
              Text("100% safe and secure")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: SwipeableButtonView(
                buttonColor: Color(0xff5cffbf),
                buttonText: 'Slide to View Appartment',
                buttonWidget: Container(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ),
                activeColor: Color(0xff0c0e21),
                isFinished: isFinished.value,
                onWaitingProcess: () {
                  Future.delayed(Duration(seconds: 2), () {
                    isFinished.value = true;
                  });
                },
                onFinish: () async {
                  await Get.to(mainHome());
                  isFinished.value = false;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
