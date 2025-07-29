import 'package:flutter/material.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class TermsAndConditions extends StatelessWidget {
  final List<Map<String, String>> conditions = [
    {
      "title": "1. Introduction",
      "description":
          "Welcome to our app. By using this application, you agree to the following terms and conditions.",
    },
    {
      "title": "2. User Obligations",
      "description":
          "Users must ensure all information provided is accurate and must not misuse the service.",
    },
    {
      "title": "3. Account Security",
      "description":
          "You are responsible for maintaining the confidentiality of your account credentials.",
    },
    {
      "title": "4. Data Privacy",
      "description":
          "We value your privacy. Your data is stored securely and handled as per our privacy policy.",
    },
    {
      "title": "5. Intellectual Property",
      "description":
          "All content in the app is protected by copyright and may not be reused without permission.",
    },
    {
      "title": "6. Service Changes",
      "description":
          "We reserve the right to modify or discontinue the service without notice.",
    },
    {
      "title": "7. Termination",
      "description":
          "We may suspend or terminate your access if you violate any terms outlined here.",
    },
    {
      "title": "8. Third-party Links",
      "description":
          "We may include links to third-party sites. We are not responsible for their content.",
    },
    {
      "title": "9. Governing Law",
      "description":
          "These terms shall be governed in accordance with the laws of your country or region.",
    },
  ];

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
                  text: "Terms & Conditions",
                  textcolor: KblackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: conditions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: conditions[index]['title']!,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textcolor: KblackColor,
                ),
                SizedBox(height: 8),
                CustomText(
                  text: conditions[index]['description']!,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textcolor: kseegreyColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
