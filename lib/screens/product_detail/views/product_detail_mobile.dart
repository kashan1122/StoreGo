import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/custom_widgets/custom_bottomsheet.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/screens/product_detail/widgets/action_button.dart';
import 'package:myapp/screens/product_detail/widgets/delivery_info.dart';
import 'package:myapp/screens/product_detail/widgets/image_sllider.dart';
import 'package:myapp/screens/product_detail/widgets/proce_selection.dart';
import 'package:myapp/screens/product_detail/widgets/product_detail.dart';
import 'package:myapp/screens/product_detail/widgets/product_info.dart';
import 'package:myapp/screens/product_detail/widgets/size_selector.dart';

class ProductDetailMobile extends StatelessWidget {
  const ProductDetailMobile({super.key, required this.data});

  final ProductEntity data;

  void showProductBottomSheet(
    BuildContext context, {
    required ProductEntity product,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return ProductBottomSheetContent(product: product);
      },
    );
  }

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
            ProductImageSlider(context, data.image),
            SizedBox(height: context.hp(2)),
            SizeSelector(context),
            SizedBox(height: context.hp(2)),
            ProductInfo(context, data.title),
            SizedBox(height: context.hp(2)),
            PriceSection(context, data.price),
            SizedBox(height: context.hp(2)),
            ProductDetails(context, data.description),
            SizedBox(height: context.hp(2)),
            ActionButtons(
                context: context,
                data: data,
                onPressCart: () {
                  print("eee");
                  showProductBottomSheet(context, product: data);
                },
                onPressBuy: () {
                  context.push("/cart");
                }),
            SizedBox(height: context.hp(2)),
            DeliveryInfo(context),
            SizedBox(height: context.hp(2)),
          ],
        ),
      ),
    );
  }
}
