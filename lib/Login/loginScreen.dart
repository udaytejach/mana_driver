import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mana_driver/Login/otpscreen.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.poppins(
                          color: korangeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 12),
                              const Text(
                                "🇮🇳",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "+91",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kseegreyColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 30,
                                width: 1,
                                color: const Color(0xFFBDBDBD),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFFD5D7DA),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFFD5D7DA),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: kbordergreyColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                // Send OTP Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Center(
                    child: SizedBox(
                      width: 220,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: korangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                        child: CustomText(
                          text: "Send OTP",
                          fontSize: 16,
                          textcolor: kwhiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                // Register text
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
                      CustomText(
                        text: "Register",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textcolor: korangeColor,
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
