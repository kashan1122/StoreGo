import 'package:flutter/material.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';
import 'package:myapp/screens/cart/views/cart_desktop.dart';
import 'package:myapp/screens/cart/views/cart_mobile.dart';
import 'package:myapp/screens/cart/views/cart_tablet.dart';
import 'package:myapp/screens/home/views/home_desktop.dart';
import 'package:myapp/screens/home/views/home_mobile.dart';
import 'package:myapp/screens/home/views/home_tablet.dart';
import '../../core/dependency_injection/di_container.dart';
import '../../core/responsive/responsive_layout.dart';


class CartView extends StatefulWidget {
  const CartView({super.key, required this.title});
  final String title;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  late CartBloc cartBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc = sl.get()..add(
      GetCart(userId: 1),
    );
  }
  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: CartMobile(cartBloc:cartBloc),
      tablet: const CartTablet(),
      desktop: const CartDesktop(),
    );
  }
}
