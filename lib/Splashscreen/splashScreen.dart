import 'package:flutter/material.dart';
import 'package:mana_driver/Login/selectLanguage.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 2.5 seconds, then navigate to LanguageSelectionScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LanguageSelectionScreen(),
        ),
      );
    });
  }

  double dynamicHeight(BuildContext context, double figmaHeight) {
    const baseHeight = 812;
    final screenHeight = MediaQuery.of(context).size.height;
    return (figmaHeight / baseHeight) * screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: korangeColor,
      body: Column(
        children: [
          SizedBox(height: dynamicHeight(context, 296)),

          Center(
            child: Image.asset(
              'images/app_logo.png',
              width: 260,
              height: 260,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: dynamicHeight(context, 470 - 296)),

          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Made in India',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textcolor: kwhiteColor,
                ),
                SizedBox(width: 5),
                Image.asset(
                  'images/flag.png',
                  width: 21,
                  height: 17,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
