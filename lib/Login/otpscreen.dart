import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

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
                            "Check your phone for the OTP and enter it below.",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        textcolor: korangeColor,
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kgreyColor,
                          ),
                          children: [
                            const TextSpan(text: "OTP sent to "),
                            TextSpan(
                              text: "+91 9133135731 ",
                              style: TextStyle(
                                color:
                                    korangeColor, // your defined orange color
                              ),
                            ),
                            const TextSpan(
                              text: " this OTP will get auto entering",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50),

                      // 4-digit OTP input
                      Pinput(
                        controller: otpController,
                        length: 4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: korangeColor,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: kbordergreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: korangeColor, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Resend OTP
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: kgreyColor,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              const TextSpan(text: "You didn’t receive OTP? "),
                              TextSpan(
                                text: "Resend OTP",
                                style: TextStyle(
                                  color: korangeColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
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
                          // TODO: Validate and continue
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: korangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                        child: CustomText(
                          text: "Sign up",
                          fontSize: 16,
                          textcolor: kwhiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            );
          },
        ),
      ),
    );
  }
}
