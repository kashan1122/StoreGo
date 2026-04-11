import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/custom_bottomsheet.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/domain/entities/product_entity.dart';


class ActionButtons extends StatelessWidget {
  final BuildContext context;
  final ProductEntity data;
  final VoidCallback onPressCart;
  final VoidCallback onPressBuy;
  const ActionButtons({
    super.key,
    required this.context,
    required this.data,
    required this.onPressCart,
    required this.onPressBuy,
  });
  // const ActionButtons(this.context, this.data, this.onPressBuy, this.onPressCart, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3F92FF),
            ),
            onPressed: onPressCart,
            icon: const Icon(Icons.shopping_cart),
            label: const Text("Go to cart"),
          ),
        ),
        SizedBox(width: context.wp(3)),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: onPressBuy,
            child: const Text("Buy Now"),
          ),
        ),
      ],
    );
  }
}
