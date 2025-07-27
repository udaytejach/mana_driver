import 'package:flutter/material.dart';

import 'package:mana_driver/Login/loginScreen.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customButton.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:country_picker/country_picker.dart';
import 'package:mana_driver/Widgets/customTextField.dart';
import 'package:mana_driver/Widgets/mobileNumberInputField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "It only takes a minute to get started.",
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  textcolor: korangeColor,
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: "Quick. Simple. Hassle-free registration.",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textcolor: kgreyColor,
                ),
                const SizedBox(height: 50),

                CustomTextField(
                  controller: nameController,
                  labelText: 'Full Name',
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  controller: nameController,
                  labelText: 'Email ID',
                ),
                const SizedBox(height: 20),

                PhoneNumberInputField(
                  controller: phoneController,
                  selectedCountry: selectedCountry,
                  onCountryChanged: (Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                ),
                const SizedBox(height: 40),

                CustomButton(
                  text: 'Register Now',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  width: 220,
                  height: 53,
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "You have an account? ",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textcolor: kgreyColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: CustomText(
                        text: "Sign In",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textcolor: korangeColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
