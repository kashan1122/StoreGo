import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';

class ActionButtons extends StatelessWidget {
  final BuildContext context;
  final ProductEntity data;
  const ActionButtons(this.context, this.data, {super.key});

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
              print("eee");
              context.read<CartBloc>().add(
                AddToCart(
                  userId: 1, // your user's id
                  product: ProductEntity(
                    id: data.id,
                    title: data.title,
                    price: data.price,
                    description: data.description,
                    category: data.category,
                    image: data.image,
                  ),
                  quantity: 1, // how many to add
                ),
              );



              // BlocProvider.of<CartBloc>(context).add(AddToCart(userId: 1, product: ProductEntity{

              // }, quantity: 1));
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
            onPressed: () {
              context.push("/cart");
            },
            child: const Text("Buy Now"),
          ),
        ),
      ],
    );
  }
}
