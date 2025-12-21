// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myapp/presentation/blocs/product/product_bloc.dart';
// import 'package:myapp/presentation/blocs/product/product_state.dart';
//
// class ProductDetailView extends StatelessWidget {
//   final int postId;
//   const ProductDetailView({super.key, required this.postId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: BlocBuilder<ProductBloc, ProductState>(
//           builder: (context, state){
//             if (state.status == Status.initial) {
//               return Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "state.postData.title",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Text(
//                       "state.postData.body",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             else if (state.status == Status.error) {
//               return const Text("Failed to load");
//             }
//             else if (state.status == Status.loading) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             // 🔥 Fallback widget (required)
//             return const Center(
//               child: Text("Something went wrong"),
//             );
//           },
//
//         )
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/screens/product_detail/views/product_detail_desktop.dart';
import 'package:myapp/screens/product_detail/views/product_detail_mobile.dart';
import 'package:myapp/screens/product_detail/views/product_detail_tablet.dart';
import '../../core/responsive/responsive_layout.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: ProductDetailMobile(data: productId),
      tablet: ProductDetailTablet(data: productId),
      desktop: ProductDetailDesktop(data: productId),
    );
  }
}

