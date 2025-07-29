import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mana_driver/Sidemenu/aboutManaDriver.dart';
import 'package:mana_driver/Sidemenu/cancellationPolicyScreen.dart';
import 'package:mana_driver/Sidemenu/favoriteDriverScreen.dart';
import 'package:mana_driver/Sidemenu/helpAndSupportScreen.dart';
import 'package:mana_driver/Sidemenu/myAddressScreen.dart';
import 'package:mana_driver/Sidemenu/offersScreen.dart';
import 'package:mana_driver/Sidemenu/profilePage.dart';
import 'package:mana_driver/Sidemenu/referScreen.dart';
import 'package:mana_driver/Sidemenu/termsAndConditions.dart';

import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customButton.dart';
import 'package:mana_driver/Widgets/customText.dart';
import 'package:mana_driver/Widgets/customTextField.dart';
import 'package:mana_driver/Widgets/customoutlinedbutton.dart';
import 'package:pinput/pinput.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? selectedLanguage;
  final TextEditingController nameController = TextEditingController();
  final List<Map<String, dynamic>> menuItems = [
    {'image': 'images/address.png', 'title': 'My Address'},
    {'image': 'images/favorite.png', 'title': 'Favourite Drivers'},
    {'image': 'images/update.png', 'title': 'Update Mobile Number'},
    {'image': 'images/language.png', 'title': 'App language'},
    {'image': 'images/offers.png', 'title': 'Offers'},
    {'image': 'images/refer.png', 'title': 'Refer a Friend'},
    {'image': 'images/info.png', 'title': 'Terms & Conditions'},
    {'image': 'images/support.png', 'title': 'Help & Support'},
    {'image': 'images/policy.png', 'title': 'Cancellation policy'},
    {'image': 'images/aboutMD.png', 'title': 'About Mana Driver'},
    {'image': 'images/delete_acnt.png', 'title': 'Delete Account'},

    {'image': 'images/logout.png', 'title': 'Logout'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 46),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circle image
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                const SizedBox(width: 12),
                // Column with two texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomText(
                        text: "Ranjith Kumar",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        textcolor: korangeColor,
                      ),
                      SizedBox(height: 4),
                      CustomText(
                        text: "rohi**********17@gmail.com",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        textcolor: kseegreyColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/chevronRight.png"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
          const Divider(color: KdeviderColor),

          Expanded(
            child: ListView.separated(
              itemCount: menuItems.length,
              separatorBuilder: (_, __) => const Divider(color: KdeviderColor),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return InkWell(
                  onTap: () {
                    switch (item['title']) {
                      case 'My Address':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MyAddressScreen()),
                        );
                        break;
                      case 'Favourite Drivers':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FavouriteDriversScreen(),
                          ),
                        );
                        break;
                      case 'Update Mobile Number':
                        showDialog(
                          context: context,
                          builder: (context) {
                            final otpController = TextEditingController();

                            return AlertDialog(
                              backgroundColor: kwhiteColor,
                              title: const CustomText(
                                text: 'Update mobile number',
                                textcolor: KblackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      controller: nameController,
                                      labelText: 'Enter Mobile',
                                    ),
                                    const SizedBox(height: 20),
                                    const CustomText(
                                      text: 'Enter OTP',
                                      textcolor: KblackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(height: 10),
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
                                          border: Border.all(
                                            color: kbordergreyColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
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
                                          border: Border.all(
                                            color: korangeColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
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
                                            const TextSpan(
                                              text: "You didn’t receive OTP? ",
                                            ),
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
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomCancelButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: CustomButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: "Update",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                        break;

                      case 'App language':
                        showDialog(
                          context: context,
                          builder: (context) {
                            final otpController = TextEditingController();

                            return AlertDialog(
                              backgroundColor: kwhiteColor,

                              content: SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const CustomText(
                                          text: 'Change Your App Language',
                                          textcolor: KblackColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 58,
                                        child: DropdownButtonFormField<String>(
                                          isExpanded: true,
                                          value: selectedLanguage,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedLanguage = newValue;
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              value: 'English',
                                              child: Text('English'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Telugu',
                                              child: Text('Telugu'),
                                            ),
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Choose Language',
                                            hintStyle: GoogleFonts.poppins(
                                              color: kseegreyColor,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 16,
                                                ),
                                            fillColor: kwhiteColor,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFE0E0E0),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFD5D7DA),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFD5D7DA),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomCancelButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: CustomButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: "Change",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                        break;
                      case 'Offers':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => OffersScreen()),
                        );
                        break;
                      case 'Refer a Friend':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReferFriendScreen(),
                          ),
                        );
                        break;
                      case 'Terms & Conditions':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TermsAndConditions(),
                          ),
                        );
                        break;
                      case 'Help & Support':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HelpAndSupport()),
                        );
                        break;
                      case 'Cancellation policy':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CancellationPolicyScreen(),
                          ),
                        );
                        break;
                      case 'About Mana Driver':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AboutManaDriverScreen(),
                          ),
                        );
                        break;
                      case 'Delete Account':
                        showDialog(
                          context: context,
                          builder: (context) {
                            final otpController = TextEditingController();

                            return AlertDialog(
                              backgroundColor: kwhiteColor,

                              content: SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 10),
                                        Image.asset("images/deleteacnt.png"),
                                        const SizedBox(height: 10),
                                        CustomText(
                                          text: "Warning",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          textcolor: KblackColor,
                                        ),
                                        const SizedBox(height: 10),

                                        CustomText(
                                          text:
                                              "Are you sure want to delete your account?",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          textcolor: kseegreyColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomCancelButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: CustomButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: "Confirm",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                        break;
                      case 'Logout':
                        _showLogoutDialog();
                        break;
                    }
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset(
                          item['image'],
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomText(
                            text: item['title'],
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textcolor: KblackColor,
                          ),
                        ),

                        Image.asset("images/chevronRight.png"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {}
}
