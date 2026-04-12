import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/screens/cart/widgets/checkout_item_card.dart';

class ShoppingListSection extends StatelessWidget {
  const ShoppingListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // SizedBox(width: context.hp(16)),


        /// Example items (later from CartBloc)
        CheckoutItemCard(
          title: 'Women’s Casual Wear',
          imageUrl: "https://dummyjson.com/img/81fPKd-2AYL._AC_SL1500_t.png",
          price: 34.00,
          oldPrice: 64.00,
          rating: 4.8,
          variations: ['Black', 'Red'],
        ),

        // SizedBox(width: context.hp(16)),
        //
        // const CheckoutItemCard(
        //   title: 'Men’s Jacket',
        //   imageUrl: 'https://via.placeholder.com/150',
        //   price: 45.00,
        //   oldPrice: 67.00,
        //   rating: 4.7,
        //   variations: ['Green', 'Grey'],
        // ),
      ],
    );
  }
}
