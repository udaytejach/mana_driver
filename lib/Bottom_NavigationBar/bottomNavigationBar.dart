import 'package:flutter/material.dart';
import 'package:mana_driver/Bottom_NavigationBar/Myrides.dart';
import 'package:mana_driver/Bottom_NavigationBar/homeScreen.dart';
import 'package:mana_driver/Bottom_NavigationBar/menuScreen.dart';
import 'package:mana_driver/Bottom_NavigationBar/transactionsScreen.dart';
import 'package:mana_driver/Widgets/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MyRidesScreen(),
    TransactionsScreen(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(
    String label,
    String imagePath,
    int index,
  ) {
    final isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 32,
            height: 32,
            color: isSelected ? korangeColor : KbottomnaviconColor,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? korangeColor : KbottomnaviconColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            _buildNavItem(localizations.bottomNavHome, 'images/home.png', 0),
            _buildNavItem(
              localizations.bottomNavMyRides,
              'images/my_rides.png',
              1,
            ),
            _buildNavItem(
              localizations.bottomNavTransactions,
              'images/transactions.png',
              2,
            ),
            _buildNavItem(localizations.bottomNavMenu, 'images/menu.png', 3),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
