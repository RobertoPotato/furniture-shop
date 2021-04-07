import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/home_page.dart';
import 'screens/categories_page.dart';
import 'screens/cart_page.dart';
import 'screens/account_page.dart';
import 'screens/help_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List pages = [
    buildHomePage(),
    buildCategoriesPage(),
    buildCartPage(),
    buildAccountPage(),
    buildHelpPage(),
  ];

  void _onSwitchTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColBackGround,
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: kColDarkBrown,
              ),
              activeIcon: Icon(
                Icons.home_rounded,
                color: kColDarkBrown,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined, color: kColDarkBrown),
              activeIcon: Icon(
                Icons.dashboard_rounded,
                color: kColDarkBrown,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: kColDarkBrown,
              ),
              activeIcon: Icon(
                Icons.shopping_cart_rounded,
                color: kColDarkBrown,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_rounded,
                color: kColDarkBrown,
              ),
              activeIcon: Icon(
                Icons.person_rounded,
                color: kColDarkBrown,
              ),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help_outline_outlined,
                color: kColDarkBrown,
              ),
              activeIcon: Icon(
                Icons.help_outlined,
                color: kColDarkBrown,
              ),
              label: 'Help',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kColDarkBrown,
          unselectedItemColor: kColDarkBrown,
          currentIndex: _currentIndex,
          //selectedItemColor: Colors.amber[800],
          onTap: _onSwitchTab,
        ),
      ),
    );
  }
}
