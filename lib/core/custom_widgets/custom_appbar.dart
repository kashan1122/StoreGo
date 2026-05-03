import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/custom_widgets/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.logo_dev, color: Colors.red,),
          CustomText(title),
        ],
      ),
      leading: const Icon(Icons.menu, color: Colors.black),
      actions: [
        GestureDetector(
            onTap: (){
              context.push('/checkout');
            },
            child: const Icon(Icons.person, color: Colors.black)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}