import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/screens/product_detail/widgets/action_button.dart';
import 'package:myapp/screens/product_detail/widgets/delivery_info.dart';
import 'package:myapp/screens/product_detail/widgets/image_sllider.dart';
import 'package:myapp/screens/product_detail/widgets/proce_selection.dart';
import 'package:myapp/screens/product_detail/widgets/product_detail.dart';
import 'package:myapp/screens/product_detail/widgets/product_info.dart';
import 'package:myapp/screens/product_detail/widgets/size_selector.dart';

class ProductDetailMobile extends StatelessWidget {
  const ProductDetailMobile({super.key, required this.data});
  final int data;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.wp(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSlider(context),
            SizedBox(height: context.hp(2)),

            SizeSelector(context),
            SizedBox(height: context.hp(2)),

            ProductInfo(context),
            SizedBox(height: context.hp(2)),

            PriceSection(context),
            SizedBox(height: context.hp(2)),

            ProductDetails(context),
            SizedBox(height: context.hp(2)),

            ActionButtons(context),
            SizedBox(height: context.hp(2)),

            DeliveryInfo(context),
            SizedBox(height: context.hp(2)),

            // BottomActions(context),
          ],
        ),
      ),
    );
  }
}
