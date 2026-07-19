import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/constants/app_assets_path.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/presentation/blocs/product/product_state.dart';
import 'package:myapp/screens/home/widgets/product_card.dart';

class ProductLisWidget extends StatelessWidget {
  const ProductLisWidget({super.key, this.state});
  final ProductState? state;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          height: context.hp(40),
          child: PageView.builder(
            padEnds: false,
            scrollDirection: Axis.horizontal,
            itemCount: state?.products.take(4).toList().length,
            controller: PageController(viewportFraction: 0.6),

            itemBuilder: (context, index) {
              final product = state?.products[index];
              final p = product;
              return ProductHorizontalCard(
                productEntity: p!,
                oldPrice: "30",
                discount: "10",
                rating: 5.00,
                reviews: 5,
                onTap: () {
                  context.push('/product_detail', extra: p);
                },
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              context.push('/product_list', extra: state?.products);
            },
            child: Image.asset(AppAssets.chevronRight, scale: 3,)
          ),
        )
      ],
    );
  }
}
