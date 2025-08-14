import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mana_driver/Bottom_NavigationBar/bottomNavigationBar.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customButton.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:mana_driver/viewmodels/login_viewmodel.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  final bool isTestOtp;

  const OtpScreen({
    super.key,
    required this.phoneNumber,

    this.isTestOtp = false,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  // static const String defaultOtp = "1234";

  Future<void> _verifyOtp() async {
    final otp = otpController.text.trim();

    if (widget.isTestOtp) {
      final vm = context.read<LoginViewModel>();
      await vm.fetchLoggedInUser(widget.phoneNumber);
      if (otp == "1234") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BottomNavigation()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
      }
    } else {}
  }

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
                              text: widget.phoneNumber,
                              style: TextStyle(color: korangeColor),
                            ),
                            const TextSpan(
                              text: " this OTP will get auto entering",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
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
                CustomButton(
                  text: 'Sign up',
                  onPressed: _verifyOtp,
                  width: 220,
                  height: 53,
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
