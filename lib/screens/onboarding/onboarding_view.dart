import 'package:flutter/material.dart';
import 'package:myapp/core/responsive/responsive_layout.dart';
import 'package:myapp/screens/onboarding/views/onboarding_desktop.dart';
import 'package:myapp/screens/onboarding/views/onboarding_mobile.dart';
import 'package:myapp/screens/onboarding/views/onboarding_tablet.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");
    return const ResponsiveLayout(
        mobile: OnBoardingMobile(),
        tablet: OnBoardingTablet(),
        desktop: OnBoardingDesktop()
    );
  }
}
