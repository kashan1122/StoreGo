import 'package:flutter/material.dart';
import 'package:myapp/screens/search/views/search_desktop.dart';
import 'package:myapp/screens/search/views/search_mobile.dart';
import 'package:myapp/screens/search/views/search_tablet.dart';
import '../../core/responsive/responsive_layout.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});
  // final List<ProductEntity> data;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return const ResponsiveLayout(
      mobile: SearchMobile(),
      tablet: SearchTablet(),
      desktop: SearchDesktop(),
    );
  }
}
