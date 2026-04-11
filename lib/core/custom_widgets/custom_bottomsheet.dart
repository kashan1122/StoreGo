import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';
import 'package:myapp/screens/product_detail/widgets/action_button.dart';

class ProductBottomSheetContent extends StatefulWidget {
  const ProductBottomSheetContent({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductBottomSheetContent> createState() =>
      _ProductBottomSheetContentState();
}

class _ProductBottomSheetContentState extends State<ProductBottomSheetContent> {
  dynamic value;
  List<String> sizeValues = ["S", "M", "L", "XL"];
  int quantity = 1;

  @override
  void initState() {
    value = sizeValues[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.wp(4)),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔘 Drag Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: context.wp(30),
                    minHeight: 50,
                    maxHeight: context.hp(14),
                  ),
                  child: CustomImage(
                    widget.product.image,
                    height: context.hp(35),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(
                  width: context.wp(2),
                ),

                /// 🏷 Product Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Best Price in StoreGo",
                      fontSize: context.sp(11),
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      "\$ ${widget.product.price}" ?? "Product",
                      fontSize: context.sp(11),
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      "Size: $value",
                      fontSize: context.sp(11),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: context.hp(2)),

            const Divider(
              color: Colors.grey,
            ),

            /// 📏 Size Selector (example)
            Wrap(
              spacing: 10,
              children: sizeValues.map((size) {
                return ChoiceChip(
                  label: Text(size),
                  selected: false,
                  onSelected: (_) {
                    setState(() {
                      value = size;
                    });
                  },
                );
              }).toList(),
            ),

            const Divider(
              color: Colors.grey,
            ),
            // SizedBox(height: context.hp(2)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  AppString.quantity,
                  fontSize: context.sp(10),
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.montserratMedium,
                ),

                /// ➖ Quantity Controls
                Row(
                  children: [
                    /// Minus Button
                    GestureDetector(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.remove, size: 16),
                      ),
                    ),

                    SizedBox(width: context.wp(3)),

                    /// Quantity Text
                    CustomText(
                      "$quantity",
                      fontSize: context.sp(12),
                      fontWeight: FontWeight.w600,
                    ),

                    SizedBox(width: context.wp(3)),

                    /// Plus Button
                    GestureDetector(
                      onTap: () {
                        setState(() => quantity++);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.hp(2)),

            /// 🛒 Buttons
            ActionButtons(
                context: context,
                data: widget.product,
                onPressCart: () {
                  context.read<CartBloc>().add(
                        AddToCart(
                          userId: 1, // your user's id
                          product: ProductEntity(
                            id: widget.product.id,
                            title: widget.product.title,
                            price: widget.product.price,
                            description: widget.product.description,
                            category: widget.product.category,
                            image: widget.product.image,
                          ),
                          quantity: quantity, // how many to add
                        ),
                      );
                },
                onPressBuy: () {
                  context.pop();
                  context.push("/cart");
                }),

            SizedBox(height: context.hp(2)),
          ],
        ),
      ),
    );
  }
}
