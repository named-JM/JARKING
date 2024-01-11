import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project_for_flutter_by_jarling/User_Auth/login.dart';
//import 'package:final_project_for_flutter_by_jarling/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashArt extends StatelessWidget {
  const SplashArt({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset('Assets/Opener Loading.json'),
          ),
          SizedBox(height: 20),
          // Adjust the height as needed
          Image.asset(
            'Assets/images/icons/jarking.png',
            width: 150,
            height: 150,
          ),

          // Text(
          //   'JARKING STUDIO',
          //   style: TextStyle(
          //     fontFamily: 'Genshin',
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
        ],
      ),
      splashIconSize: 400,
      backgroundColor: Colors.white,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      nextScreen: LoginPage(),
    );
  }
}
