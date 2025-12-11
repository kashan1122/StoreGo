import 'package:flutter/material.dart';
import 'package:myapp/screens/home/views/home_desktop.dart';
import 'package:myapp/screens/home/views/home_mobile.dart';
import 'package:myapp/screens/home/views/home_tablet.dart';
import '../../core/responsive/responsive_layout.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: HomeMobile(title: title),
      tablet: HomeTablet(title: title),
      desktop: HomeDesktop(title: title),
    );
  }
}
