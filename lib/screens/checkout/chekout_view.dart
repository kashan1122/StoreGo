import 'package:flutter/material.dart';
import 'package:myapp/core/responsive/responsive_layout.dart';
import 'package:myapp/screens/checkout/views/checkout_desktop.dart';
import 'package:myapp/screens/checkout/views/checkout_mobile.dart';
import 'package:myapp/screens/checkout/views/checkout_tablet.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return const ResponsiveLayout(
      mobile: CheckoutMobile(),
      tablet: CheckoutTablet(),
      desktop: CheckoutDesktop(),
    );
  }
}
