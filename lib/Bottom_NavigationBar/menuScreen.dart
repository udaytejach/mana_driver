import 'package:flutter/material.dart';
import 'package:mana_driver/Login/selectLanguage.dart';
import 'package:mana_driver/Sidemenu/aboutManaDriver.dart';
import 'package:mana_driver/Sidemenu/cancellationPolicyScreen.dart';
import 'package:mana_driver/Sidemenu/favoriteDriverScreen.dart';
import 'package:mana_driver/Sidemenu/helpAndSupportScreen.dart';
import 'package:mana_driver/Sidemenu/myAddressScreen.dart';
import 'package:mana_driver/Sidemenu/offersScreen.dart';
import 'package:mana_driver/Sidemenu/referScreen.dart';
import 'package:mana_driver/Sidemenu/termsAndConditions.dart';
import 'package:mana_driver/Sidemenu/updateMobilescreen.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:mana_driver/Widgets/customText.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
    {'image': 'images/logout.png', 'title': 'Logout'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 46),

          Row(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UpdateMobileScreen(),
                          ),
                        );
                        break;
                      case 'App language':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LanguageSelectionScreen(),
                          ),
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
                      case 'Logout':
                        _showLogoutDialog(); // Or handle logout logic here
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
