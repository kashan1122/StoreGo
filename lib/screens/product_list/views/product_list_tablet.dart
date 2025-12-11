import 'package:flutter/material.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import '../widgets/product_card.dart';

class ProductListTablet extends StatefulWidget {
  const ProductListTablet({super.key, required this.data});

  final List<ProductEntity> data;

  @override
  State<ProductListTablet> createState() => _ProductListTabletState();
}

class _ProductListTabletState extends State<ProductListTablet> {
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: const Text("title"),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 👉 2 items in a row
            childAspectRatio: 0.6, // 👉 Adjust height ratio
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            final product = widget.data[index];
            final p = product;

            return ProductHorizontalCard(
              image: p.image,
              title: p.title,
              description: p.description,
              price: "${p.price}",
              oldPrice: "30",
              discount: "10",
              rating: 5.00,
              reviews: 5,
              onTap: () {},
            );
          },
        ));
  }
}
