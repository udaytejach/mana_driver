import 'package:flutter/material.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VehicleDetailsScreen extends StatelessWidget {
  const VehicleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  text: "Vehicle Details",
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container(
                //   width: 130,
                //   height: 97,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade100,
                //     borderRadius: BorderRadius.circular(12),
                //   ),
                //   child: Image.asset("images/swift.png"),
                // ),
                Container(
                  width: 130,
                  height: 97,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CarouselSlider(
                      items: [
                        Image.asset(
                          "images/swift.png",
                          fit: BoxFit.contain,
                          width: 130,
                        ),
                        Image.asset(
                          "images/swift.png",
                          fit: BoxFit.contain,
                          width: 130,
                        ),
                        Image.asset(
                          "images/swift.png",
                          fit: BoxFit.contain,
                          width: 130,
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 97,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 3),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Maruti Swift Dzire VXI",
                        textcolor: KblackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),

                      CustomText(
                        text:
                            "Exceptional performance and premium comfort features.",
                        textcolor: kgreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),

                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "₹7,957",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: korangeColor,
                              ),
                            ),
                            TextSpan(
                              text: "/per ride",
                              style: TextStyle(color: kgreyColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _sectionCard(
              title: "Key Specifications",
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _SpecItem(
                        iconPath: 'images/mileage.png',
                        label: "Mileage",
                        value: "24kmpl",
                      ),
                      _SpecItem(
                        iconPath: 'images/fuel.png',
                        label: "Fuel Type",
                        value: "Petrol",
                      ),
                      _SpecItem(
                        iconPath: 'images/settings.png',
                        label: "Transmission",
                        value: "Manual",
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _SpecItem(
                        iconPath: 'images/peoples.png',
                        label: "Seats",
                        value: "5",
                      ),
                      _SpecItem(
                        iconPath: 'images/paint.png',
                        label: "Color",
                        value: "White",
                      ),
                      _SpecItem(
                        iconPath: 'images/date.png',
                        label: "Year",
                        value: "2024",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Features & Equipment
            _section(
              title: "Features & Equipment",
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "• All-Wheel Drive",
                    textcolor: KblackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: "• Premium Package",
                    textcolor: KblackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: "• Navigation",
                    textcolor: KblackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: "• Heated Seats",
                    textcolor: KblackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _section(
              title: "About Vehicle",
              child: CustomText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
                    "standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                textcolor: KblackColor,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 30),

            // Button
            Center(
              child: SizedBox(
                width: 220,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: korangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                  onPressed: () {},
                  child: CustomText(
                    text: "Book a Driver",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: kwhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kbordergreyColor, width: 1),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                text: title,
                textcolor: korangeColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _section({required String title, required Widget child}) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kbordergreyColor, width: 1),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                text: title,
                textcolor: korangeColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),
            Padding(padding: const EdgeInsets.only(left: 10), child: child),
          ],
        ),
      ),
    );
  }
}

class _SpecItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  const _SpecItem({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 18, width: 18, fit: BoxFit.contain),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: label,
                textcolor: kgreyColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              const SizedBox(height: 2),
              CustomText(
                text: value,
                textcolor: KblackColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
