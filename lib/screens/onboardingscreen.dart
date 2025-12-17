import 'package:flutter/material.dart';
import 'package:khata_app/custom_widgets/pageslider.dart';
import 'package:khata_app/screens/loginscreen.dart';
import 'package:khata_app/screens/signupscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
              PageSlider(
                  image: "assets/images/slide1.png",
                  title: "Gain total control of your money",
                  subtitle: "Become your own money manager and make every cent count",
                ),
                PageSlider(
                  image: "assets/images/slide2.png",
                  title: "Know where your money goes",
                  subtitle: "Track your transaction easily, with categories and financial report",
                ),
                PageSlider(
                  image: "assets/images/slide3.png",
                  title: "Planning ahead",
                  subtitle: "Setup your budget for each category so you in control",
                ),
              ],
            ),
          ),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.purple,
              dotColor: Colors.grey.shade300,
              dotHeight: 5,
              dotWidth: 5,
            ),
          ),
          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Color(0XFF7F3DFF),
                minimumSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
              },
              child: Text("Sign Up",style: TextStyle(color: Color(0xffFCFCFC)),),
            ),
          ),

        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0XFFEEE5FF), width: 2),
                minimumSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
              },
              child: Text("Login", style: TextStyle(color: Color(0xff7F3DFF))),
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

}
