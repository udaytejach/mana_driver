import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDropLocation2Visible = false;
  PageController _pageController = PageController(viewportFraction: 1);
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  PageController _offerPageController = PageController(viewportFraction: 1);
  int _offerCurrentPage = 0;
  Timer? _offerAutoScrollTimer;

  PageController _watchPageController = PageController(viewportFraction: 1);
  int _watchCurrentPage = 0;
  Timer? _watchAutoScrollTimer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _startWatchAutoScroll();
    _startOfferAutoScroll();
  }

  void _startOfferAutoScroll() {
    _offerAutoScrollTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_offerPageController.hasClients) {
        if (_offerCurrentPage < offerImages.length - 1) {
          _offerCurrentPage++;
        } else {
          _offerCurrentPage = 0;
        }

        _offerPageController.animateToPage(
          _offerCurrentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _startWatchAutoScroll() {
    _watchAutoScrollTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_watchPageController.hasClients) {
        if (_watchCurrentPage < watchLearnImages.length - 1) {
          _watchCurrentPage++;
        } else {
          _watchCurrentPage = 0;
        }

        _watchPageController.animateToPage(
          _watchCurrentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        if (_currentPage < carList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    _watchPageController.dispose();
    _watchAutoScrollTimer?.cancel();
    _offerPageController.dispose();
    _offerAutoScrollTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: isDropLocation2Visible ? 350 : 300,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'images/map.png',
                    width: double.infinity,
                    height: 252,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 50,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CustomText(
                              text: "Namaskaram",
                              textcolor: kseegreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              text: "Ranjith Kumar",
                              textcolor: korangeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: KnotificationcircleColor,
                              width: 1,
                            ),
                          ),
                          child: Image.asset(
                            'images/notification.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 160,
                    right: 12,
                    left: 12,
                    child: Container(
                      width: 350,
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: kbordergreyColor, blurRadius: 12),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/pickupIcon.png',
                                width: 28,
                                height: 28,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Pickup Location",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      textcolor: kgreyColor,
                                    ),
                                    SizedBox(height: 1),
                                    TextField(
                                      enabled: true,
                                      textInputAction: TextInputAction.next,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: KblackColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Enter pickup location",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: KblackColor,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 0,
                                        ),
                                        isDense: true,
                                        border: InputBorder.none,
                                      ),
                                      onTap: () {
                                        print('Pickup location tapped');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: kbordergreyColor,
                                  thickness: 1.3,
                                ),
                              ),
                              SizedBox(width: 15),

                              SizedBox(
                                height: 30,
                                width: 68,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        isDropLocation2Visible
                                            ? Colors.red
                                            : korangeColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isDropLocation2Visible =
                                          !isDropLocation2Visible;
                                    });
                                  },
                                  child: CustomText(
                                    text:
                                        isDropLocation2Visible
                                            ? 'Delete'
                                            : 'Add',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    textcolor: kwhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 3),

                          Row(
                            children: [
                              Image.asset(
                                'images/dropIcon.png',
                                width: 28,
                                height: 28,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Drop Location",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      textcolor: kgreyColor,
                                    ),
                                    SizedBox(height: 1),
                                    TextField(
                                      enabled: true,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: KblackColor,
                                      ),
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        hintText: "Enter drop location",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: KblackColor,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 0,
                                        ),
                                        isDense: true,
                                        border: InputBorder.none,
                                      ),
                                      onTap: () {
                                        print('Drop location tapped');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          if (isDropLocation2Visible) ...[
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Image.asset(
                                  'images/dropIcon.png',
                                  width: 28,
                                  height: 28,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Drop Location 2",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        textcolor: kgreyColor,
                                      ),
                                      SizedBox(height: 1),
                                      TextField(
                                        enabled: true,
                                        textInputAction: TextInputAction.done,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: KblackColor,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Enter drop location 2",
                                          hintStyle: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: KblackColor,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 0,
                                          ),
                                          isDense: true,
                                          border: InputBorder.none,
                                        ),
                                        onTap: () {
                                          print('Drop location 2 tapped');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              color: kwhiteColor,

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'My Vehicles',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textcolor: KblackColor,
                      ),
                      Text(
                        'View Vehicles',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: korangeColor,
                          decoration: TextDecoration.underline,
                          decorationColor: korangeColor,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  SizedBox(
                    height: 130,
                    child: PageView.builder(
                      itemCount: carList.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        final car = carList[index];
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: korangeColor, width: 1.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      car.imagePath,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: car.name,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        textcolor: KblackColor,
                                      ),
                                      SizedBox(height: 5),
                                      Wrap(
                                        spacing: 6,
                                        children: [
                                          _infoChip(car.kmsDriven),
                                          _infoChip(car.transmission),
                                          _infoChip(car.fuelType),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: car.price,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: korangeColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/per ride',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),

                  SmoothPageIndicator(
                    controller: _pageController,
                    count: carList.length,
                    effect: WormEffect(
                      dotHeight: 6,
                      dotWidth: 30,
                      activeDotColor: korangeColor,
                      dotColor: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: 25),

                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: korangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                      ),
                      onPressed: () {},
                      child: CustomText(
                        text: "Book A Driver",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textcolor: kwhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Divider(height: 4, color: KdeviderColor, thickness: 5),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              color: kwhiteColor,

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Offers',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textcolor: KblackColor,
                      ),
                      Text(
                        'View Offers',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: korangeColor,
                          decoration: TextDecoration.underline,
                          decorationColor: korangeColor,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 140,
                    child: PageView.builder(
                      controller: _offerPageController,
                      itemCount: offerImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              offerImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _offerPageController,
                      count: offerImages.length,
                      effect: WormEffect(
                        dotHeight: 6,
                        dotWidth: 40,
                        activeDotColor: korangeColor,
                        dotColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              color: kwhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Watch & Learn',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textcolor: KblackColor,
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 130,
                    child: PageView.builder(
                      controller: _watchPageController,
                      itemCount: watchLearnImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              watchLearnImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _watchPageController,
                      count: watchLearnImages.length,
                      effect: WormEffect(
                        dotHeight: 6,
                        dotWidth: 40,
                        activeDotColor: korangeColor,
                        dotColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'PREMIUM FEEL FOR DRIVER SERVICES ✨',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: KbottomnaviconColor,
                        letterSpacing: -1.0,
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      CustomText(
                        text: 'Made in India',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textcolor: KbottomnaviconColor,
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'images/flag.png',
                        width: 21,
                        height: 17,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: KdeviderColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CustomText(
        text: text,
        fontSize: 10,
        fontWeight: FontWeight.w300,
        textcolor: KblackColor,
      ),
    );
  }

  final List<String> watchLearnImages = [
    'images/driver.png',
    'images/driver.png',
    'images/driver.png',
  ];

  final List<String> offerImages = [
    'images/offer.png',
    'images/offer.png',
    'images/offer.png',
  ];

  List<CarModel> carList = [
    CarModel(
      imagePath: 'images/swift.png',
      name: 'Maruti Swift Dzire VXI',
      kmsDriven: '76,225 km',
      transmission: 'Manual',
      fuelType: 'Petrol',
      price: '₹7,957',
    ),
    CarModel(
      imagePath: 'images/mahindra.png',
      name: 'Mahindra MARAZZO M2 7STR',
      kmsDriven: '45,120 km',
      transmission: 'Automatic',
      fuelType: 'Diesel',
      price: '₹9,995',
    ),
    CarModel(
      imagePath: 'images/tata.png',
      name: 'Tata Nexon XZ+',
      kmsDriven: '60,000 km',
      transmission: 'Manual',
      fuelType: 'Petrol',
      price: '₹9,100',
    ),
  ];
}

class CarModel {
  final String imagePath;
  final String name;
  final String kmsDriven;
  final String transmission;
  final String fuelType;
  final String price;

  CarModel({
    required this.imagePath,
    required this.name,
    required this.kmsDriven,
    required this.transmission,
    required this.fuelType,
    required this.price,
  });
}
