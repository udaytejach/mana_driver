import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mana_driver/Login/registration.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import '../services/repository.dart';
import '../viewmodels/login_viewmodel.dart';
import 'otpscreen.dart';
import '../Widgets/colors.dart';
import '../Widgets/customButton.dart';
import '../Widgets/customText.dart';
import '../Widgets/mobileNumberInputField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(RepositoryData()),
      child: _LoginScreenBody(),
    );
  }
}

class _LoginScreenBody extends StatefulWidget {
  @override
  State<_LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<_LoginScreenBody> {
  final TextEditingController phoneController = TextEditingController();

  Future<void> _handleSendOtp(BuildContext context) async {
    final vm = context.read<LoginViewModel>();

    await vm.checkPhoneAndSendOtp(
      phoneNumber: phoneController.text,
      context: context,
      onCodeSent: (verificationId) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => OtpScreen(
                  // verificationId: verificationId,
                  phoneNumber:
                      "+${vm.selectedCountry.phoneCode}${phoneController.text}",
                ),
          ),
        );
      },
      onError: (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    final state = vm.state;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    selectedCountry: vm.selectedCountry,
                    onCountryChanged: (Country country) {
                      vm.setCountry(country);
                    },
                  ),
                  if (state.errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),

            CustomButton(
              text: state.isLoading ? "Checking..." : "Send OTP",
              onPressed:
                  state.isLoading
                      ? null
                      : () async {
                        final phoneNumber = phoneController.text.trim();
                        if (phoneNumber.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter mobile number"),
                            ),
                          );
                          return;
                        }

                        final exists = await _checkUserExists(phoneNumber);

                        if (exists) {
                          await vm.fetchLoggedInUser(phoneNumber);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => OtpScreen(
                                    phoneNumber: phoneNumber,
                                    isTestOtp: true,
                                  ),
                            ),
                          );
                        } else {
                          _handleSendOtp(context);
                        }
                      },
              width: 220,
              height: 50,
            ),

            const SizedBox(height: 10),
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
        ),
      ),
    );
  }

  Future<bool> _checkUserExists(String phoneNumber) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('phone', isEqualTo: phoneNumber)
            .limit(1)
            .get();
    return snapshot.docs.isNotEmpty;
  }
}
