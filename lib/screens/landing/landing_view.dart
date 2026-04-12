import 'package:flutter/material.dart';
import 'package:myapp/screens/landing/views/landing_desktop.dart';
import 'package:myapp/screens/landing/views/landing_mobile.dart';
import 'package:myapp/screens/landing/views/landing_tablet.dart';
import '../../core/responsive/responsive_layout.dart';


class LandingView extends StatelessWidget {
  const LandingView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return const ResponsiveLayout(
      mobile: LandingMobile(),
      tablet: LandingTablet(),
      desktop: LandingDesktop(),
    );
  }
}
