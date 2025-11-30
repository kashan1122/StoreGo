import 'package:flutter/material.dart';
import 'package:myapp/screens/product_list/views/product_list_desktop.dart';
import 'package:myapp/screens/product_list/views/product_list_mobile.dart';
import 'package:myapp/screens/product_list/views/product_list_tablet.dart';
import '../../core/responsive/responsive_layout.dart';


class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: ProductListMobile(title: title),
      tablet: ProductListTablet(title: title),
      desktop: ProductListDesktop(title: title),
    );
  }
}
