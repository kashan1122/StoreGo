import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';

class ActionButtons extends StatelessWidget {
  final BuildContext context;
  const ActionButtons(this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3F92FF),
            ),
            onPressed: () {
              // context.read<CartBloc>().add(
              //     AddToCart(1, 1)
              // );
            },
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
            onPressed: () {},
            child: const Text("Buy Now"),
          ),
        ),
      ],
    );
  }
}
