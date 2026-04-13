import 'package:flutter/material.dart';
import 'package:myapp/screens/cart/views/cart_desktop.dart';
import 'package:myapp/screens/cart/views/cart_mobile.dart';
import 'package:myapp/screens/cart/views/cart_tablet.dart';
import 'package:myapp/screens/home/views/home_desktop.dart';
import 'package:myapp/screens/home/views/home_mobile.dart';
import 'package:myapp/screens/home/views/home_tablet.dart';
import '../../core/responsive/responsive_layout.dart';


class CartView extends StatelessWidget {
  const CartView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return const ResponsiveLayout(
      mobile: CartMobile(),
      tablet: CartTablet(),
      desktop: CartDesktop(),
    );
  }
}
