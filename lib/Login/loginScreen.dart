import 'package:flutter/material.dart';

import 'package:mana_driver/Login/otpscreen.dart';
import 'package:mana_driver/Login/registration.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customButton.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:country_picker/country_picker.dart';
import 'package:mana_driver/Widgets/mobileNumberInputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "India",
    e164Key: "",
  );
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            "We're ready when you are. Sign in and continue your ride.",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        textcolor: korangeColor,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text:
                            "Enter your mobile number to get started we'll send you an OTP for verification.",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textcolor: kgreyColor,
                      ),
                      const SizedBox(height: 50),

                      PhoneNumberInputField(
                        controller: phoneController,
                        selectedCountry: selectedCountry,
                        onCountryChanged: (Country country) {
                          setState(() {
                            selectedCountry = country;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                CustomButton(
                  text: 'Send OTP',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OtpScreen()),
                    );
                  },
                  width: 220,
                  height: 50,
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "You don’t have an account? ",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textcolor: kgreyColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: "Register",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textcolor: korangeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
