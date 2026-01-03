import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_state.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/screens/cart/widgets/delivery_address.dart';
import 'package:myapp/screens/cart/widgets/shopping_list.dart';


class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return  const ShoppingListSection();
                        }
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
