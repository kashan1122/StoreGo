import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_state.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/screens/cart/widgets/delivery_address.dart';
import 'package:myapp/screens/cart/widgets/shopping_list.dart';

class CartMobile extends StatefulWidget {
  const CartMobile({super.key});

  @override
  State<CartMobile> createState() => _CartMobileState();
}

class _CartMobileState extends State<CartMobile> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const CustomText("CART SCREEN"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DeliveryAddressSection(),
          SizedBox(height: context.hp(3)),
          const CustomText(
            ' Shopping List',
            // style: AppTextStyle.title,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                    print("CART CONTEXT: $context");
                    print("cart item: ${state.status}");
                    if (state.status == CartStatus.loading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    }
                    return const ShoppingListSection();
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.black, Colors.black],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
