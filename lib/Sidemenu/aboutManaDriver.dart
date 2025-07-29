import 'package:flutter/material.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class AboutManaDriverScreen extends StatelessWidget {
  final List<Map<String, String>> conditions = [
    {
      "title": "About Mana Driver",
      "description":
          "Mana Driver - Mee Vahanam, Maa Driver!\nMana Driver is your trusted platform to book professional, verified drivers anytime you need. Whether it's a one-way ride, round trip, hourly booking, or outstation travel - we've got you covered.",
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
                  text: "About Mana Driver",
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
