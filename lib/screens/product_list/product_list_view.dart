import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/screens/product_list/views/product_list_desktop.dart';
import 'package:myapp/screens/product_list/views/product_list_mobile.dart';
import 'package:myapp/screens/product_list/views/product_list_tablet.dart';
import '../../core/responsive/responsive_layout.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.data});
  final List<ProductEntity> data;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: ProductListMobile(data: data),
      tablet: ProductListTablet(data: data),
      desktop: ProductListDesktop(data: data),
    );
  }
}
