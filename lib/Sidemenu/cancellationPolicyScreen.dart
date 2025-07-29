import 'package:flutter/material.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class CancellationPolicyScreen extends StatelessWidget {
  const CancellationPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, top: 5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    "images/chevronLeft.png",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              Center(
                child: CustomText(
                  text: "Cancellation policy",
                  textcolor: KblackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('1. Free Cancellation Window'),
            const SectionDescription(
              'You can cancel your booking within 5 minutes of confirmation without any charges.',
            ),
            const SizedBox(height: 20),
            const SectionTitle('2. Cancellation After 5 Minutes'),
            const SectionDescription(
              '• 50 cancellation fee will be charged if:\n'
              '• Driver already started the trip.\n'
              '• Driver waited at your location for more than 10',
            ),
            const SizedBox(height: 20),
            const SectionTitle('3. No-Show Policy (Customer absent)'),
            const SectionDescription(
              'If customer is not available at pickup point even after 15 minutes, trip will be auto-cancelled. #100 will be charged as no-show',
            ),
            const SizedBox(height: 20),
            const SectionTitle('4. Driver Cancellation'),
            const SectionDescription(
              'If a driver cancels after accepting, we will reassign another driver. Repeated cancellations by drivers will lead to penalties and suspension.',
            ),
            const SizedBox(height: 20),
            const SectionTitle('5. Refund Timeline'),
            const SectionDescription(
              'If you paid online, eligible refunds will be processed within 3-5 business days.',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      textcolor: KblackColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }
}

class SectionDescription extends StatelessWidget {
  final String text;

  const SectionDescription(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        CustomText(
          text: text,
          textcolor: kgreyColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ],
    );
  }
}
