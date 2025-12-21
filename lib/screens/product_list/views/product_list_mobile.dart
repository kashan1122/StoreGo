import 'package:flutter/material.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import '../../../core/custom_widgets/textformfield.dart';
import '../widgets/product_card.dart';

class ProductListMobile extends StatefulWidget {
  const ProductListMobile({super.key, required this.data});

  final List<ProductEntity> data;

  @override
  State<ProductListMobile> createState() => _ProductListMobileState();
}

class _ProductListMobileState extends State<ProductListMobile> {
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: const Text("title"),
        ),
        body: Column(
          children: [
            CustomTextFormField(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              hintText: AppString.searchProduct,
              controller: searchCtrl,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                return null;
              },
            ),
            SizedBox(height: context.hp(2)),

            ///Featured, Sort & Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "${widget.data.length}+ Items",
                  fontSize: 16,
                  fontFamily: AppFonts.montserratSemiBold,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // Shadow color with opacity
                            spreadRadius: 2,
                            // How much the shadow spreads
                            blurRadius: 5,
                            // Blurriness of the shadow
                            offset: const Offset(
                                0, 2), // Shifts the shadow down by 3 pixels
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            AppString.sort,
                            fontSize: 12,
                            fontFamily: AppFonts.montserratRegular,
                            maxLines: 1,
                          ),
                          const Icon(Icons.sort)
                        ],
                      ),
                    ),
                    SizedBox(width: context.wp(4)),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // Shadow color with opacity
                            spreadRadius: 2,
                            // How much the shadow spreads
                            blurRadius: 5,
                            // Blurriness of the shadow
                            offset: const Offset(
                                0, 2), // Shifts the shadow down by 3 pixels
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            AppString.filter,
                            fontSize: 12,
                            fontFamily: AppFonts.montserratRegular,
                            maxLines: 1,
                          ),
                          const Icon(Icons.filter_alt_outlined)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
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
              ),
            ),
          ],
        ));
  }
}
