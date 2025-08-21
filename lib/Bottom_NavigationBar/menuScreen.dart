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
import 'package:mana_driver/viewmodels/login_viewmodel.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:mana_driver/services/locale_provider.dart';

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
    final vm = context.watch<LoginViewModel>();
    final userName = vm.loggedInUser?['fullName'] ?? 'Guest';
    final userEmail = vm.loggedInUser?['email'] ?? 'Guest';

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildProfileTile(),
              const Divider(color: KdeviderColor),
              Expanded(
                child: ListView.separated(
                  itemCount: menuItems.length,
                  separatorBuilder:
                      (_, __) => const Divider(color: KdeviderColor),
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return _buildMenuItem(item['image'], item['title']);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileTile() {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('images/user.png'),
          ),
          const SizedBox(width: 12),
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
          Image.asset("images/chevronRight.png", width: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String imagePath, String title) {
    return InkWell(
      onTap: () => _handleMenuAction(title),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            Image.asset(imagePath, width: 24, height: 24),
            const SizedBox(width: 12),
            Expanded(
              child: CustomText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textcolor: KblackColor,
              ),
            ),
            Image.asset("images/chevronRight.png", width: 20),
          ],
        ),
      ),
    );
  }

  void _handleMenuAction(String title) {
    switch (title) {
      case 'My Address':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MyAddressScreen()),
        );
        break;
      case 'Favourite Drivers':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FavouriteDriversScreen()),
        );
        break;
      case 'Update Mobile Number':
        _showUpdateMobileDialog();
        break;
      case 'App language':
        _showLanguageDialog();
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
          MaterialPageRoute(builder: (_) => ReferFriendScreen()),
        );
        break;
      case 'Terms & Conditions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TermsAndConditions()),
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
          MaterialPageRoute(builder: (_) => CancellationPolicyScreen()),
        );
        break;
      case 'About Mana Driver':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AboutManaDriverScreen()),
        );
        break;
      case 'Delete Account':
        _showDeleteAccountDialog();
        break;
      case 'Logout':
        _showLogoutDialog();
        break;
    }
  }

  void _showUpdateMobileDialog() {
    final otpController = TextEditingController();
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: kwhiteColor,
            title: const CustomText(
              text: 'Update mobile number',
              textcolor: KblackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Pinput(
                  controller: otpController,
                  length: 4,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: _pinTheme(),
                  focusedPinTheme: _focusedPinTheme(),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t received? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: kgreyColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Resend",
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
            actions: _dialogActions(
              onConfirm: () {
                Navigator.pop(context);
              },
            ),
          ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: kwhiteColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Change Your App Language',
                  textcolor: KblackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: selectedLanguage,
                  onChanged:
                      (newValue) => setState(() => selectedLanguage = newValue),
                  items: const [
                    DropdownMenuItem(value: 'English', child: Text('English')),
                    DropdownMenuItem(value: 'Telugu', child: Text('Telugu')),
                    DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
                  ],
                  decoration: _dropdownDecoration('Choose Language'),
                ),
              ],
            ),
            actions: _dialogActions(
              onConfirm: () {
                if (selectedLanguage != null) {
                  final localeProvider = Provider.of<LocaleProvider>(
                    context,
                    listen: false,
                  );
                  if (selectedLanguage == 'English') {
                    localeProvider.setLocale(const Locale('en'));
                  } else if (selectedLanguage == 'Hindi') {
                    localeProvider.setLocale(const Locale('hi'));
                  } else if (selectedLanguage == 'Telugu') {
                    localeProvider.setLocale(const Locale('te'));
                  }
                }
                Navigator.pop(context);
              },
            ),
          ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: kwhiteColor,
            content: SizedBox(
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("images/deleteacnt.png", height: 100),
                  const SizedBox(height: 12),
                  const CustomText(
                    text: "Warning",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textcolor: KblackColor,
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: "Are you sure want to delete your account?",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textcolor: kseegreyColor,
                  ),
                ],
              ),
            ),
            actions: _dialogActions(
              onConfirm: () {
                Navigator.pop(context);
              },
              confirmText: "Confirm",
            ),
          ),
    );
  }

  List<Widget> _dialogActions({
    required VoidCallback onConfirm,
    String confirmText = "Update",
  }) {
    return [
      Row(
        children: [
          Expanded(
            child: CustomCancelButton(
              text: "Cancel",
              onPressed: () {},
              height: 46,
              width: 140,
            ),

            // CustomCancelButton(onPressed: () => Navigator.pop(context)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CustomButton(
              onPressed: onConfirm,
              text: confirmText,
              height: 46,
              width: 140,
            ),
          ),
        ],
      ),
    ];
  }

  PinTheme _pinTheme() => PinTheme(
    width: 60,
    height: 50,
    textStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: korangeColor,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: kbordergreyColor),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 5),
  );

  PinTheme _focusedPinTheme() => _pinTheme().copyWith(
    textStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: korangeColor, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  InputDecoration _dropdownDecoration(String hint) => InputDecoration(
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: korangeColor),
    ),
  );

  void _showLogoutDialog() {
    // Implement logout confirmation logic
  }
}
