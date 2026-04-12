import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_state.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/screens/cart/cart_view.dart';
import 'package:myapp/screens/cart/widgets/delivery_address.dart';
import 'package:myapp/screens/cart/widgets/shopping_list.dart';
import 'package:myapp/screens/home/home_view.dart';
import 'package:myapp/screens/landing/nav_model.dart';

class LandingMobile extends StatefulWidget {
  const LandingMobile({super.key});

  @override
  State<LandingMobile> createState() => _LandingMobileState();
}

class _LandingMobileState extends State<LandingMobile> {



  // List<String> bodyTitles = [
  //   "Product List",
  //   "Cart List",
  //   "Profile",
  //   "Menu"
  // ];
  //
  // List<Widget> bodyPages = [
  //   const HomeView(title: "Product List"),
  //   const CartView(title: "Cart List"),
  //   const Center(
  //     child: Text("PROFILE"),
  //   ),
  //   const Center(
  //     child: Text("MENU"),
  //   ),
  // ];
  final List<NavItem> navItems = [
    NavItem(
      title: "Product List",
      page: const HomeView(title: "Product List"),
    ),
    NavItem(
      title: "Cart List",
      page: const CartView(title: "Cart List"),
    ),
    NavItem(
      title: "Profile",
      page: const Center(child: Text("PROFILE")),
    ),
    NavItem(
      title: "Menu",
      page: const Center(child: Text("MENU")),
    ),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(navItems[_selectedIndex].title),
      ),
      body: navItems[_selectedIndex].page,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          child: Container(
            child: BottomNavigationBar(
              backgroundColor: AppColors.secondary,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  // icon: Image.asset(AssetPaths.homeIcon, scale: 5),
                  icon: Icon(Icons.home, size: 20,),
                  label: 'home',
                  backgroundColor: AppColors.secondary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel, size: 20,),
                  label: 'Cart',
                  backgroundColor: AppColors.secondary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility, size: 20,),
                  label: 'Profile',
                  backgroundColor: AppColors.secondary,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu, size: 20,),
                  label: 'Menu',
                  backgroundColor: AppColors.secondary,
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.primary,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
