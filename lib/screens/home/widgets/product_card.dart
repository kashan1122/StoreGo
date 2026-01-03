import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/cart/cart_bloc.dart';
import 'package:myapp/presentation/blocs/cart/cart_event.dart';

class ProductHorizontalCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final double rating;
  final int reviews;
  final VoidCallback onTap;
  final bool isShowRating;

  const ProductHorizontalCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.onTap,
    this.isShowRating = true
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomImage(
                  image,
                  width: double.infinity,
                  height: context.hp(15),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: context.hp(1)),

            /// TITLE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
              child: CustomText(
                title,
                fontSize: 14,
                // fontWeight: FontWeight.w600,
                fontFamily: AppFonts.montserratMedium,
                // maxLines: 1,
              ),
            ),

            SizedBox(height: context.hp(0.5)),

            /// DESCRIPTION
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
              child: CustomText(
                description,
                fontSize: 10,
                fontFamily: AppFonts.montserratRegular,
                color: Colors.black54,
                maxLines: 2,
              ),
            ),

            SizedBox(height: context.hp(1.5)),

            /// PRICES ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            "\$$price",
                            fontSize: 12,
                            fontFamily: AppFonts.montserratMedium,
                            // fontWeight: FontWeight.bold,
                          ),
                          SizedBox(width: context.wp(3)),
                          Row(
                            children: [
                              CustomText(
                                "\$$oldPrice",
                                fontSize: 12,
                                fontFamily: AppFonts.montserratLight,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                // decoration: TextDecoration.lineThrough,
                              ),
                              SizedBox(width: context.wp(2)),
                              CustomText(
                                "$discount%Off",
                                fontSize: 10,
                                fontFamily: AppFonts.montserratRegular,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print("eee");
                    context.read<CartBloc>().add(
                      AddToCart(
                        userId: 1, // your user's id
                        product: ProductEntity(
                          id: 101,
                          title: "Example Product",
                          price: 19.99,
                          description: "This is a sample product",
                          category: "Category",
                          image: "http://example.com/image.jpg",
                        ),
                        quantity: 1, // how many to add
                      ),
                    );

                  },
                  child: Row(
                    children: [
                      const CustomText("Add to Cart",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: context.hp(1)),
                    ],
                  ),
                ),


              ],
            ),

            SizedBox(height: context.hp(1)),

            /// ⭐ RATING + REVIEWS
            isShowRating?Padding(
              padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: context.sp(16),
                      color: index < rating ? Colors.amber : Colors.grey[300],
                    ),
                  ),
                  SizedBox(width: context.wp(2)),
                  CustomText(
                    reviews.toString(),
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ],
              ),
            ):
            const SizedBox.shrink(),

            SizedBox(height: context.hp(1)),

            // /// ARROW BUTTON
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: GestureDetector(
            //     onTap: onTap,
            //     child: Container(
            //       margin: EdgeInsets.only(
            //           right: context.wp(3), bottom: context.hp(1)),
            //       width: context.wp(12),
            //       height: context.wp(12),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.white,
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black12,
            //             blurRadius: 6,
            //             spreadRadius: 1,
            //           )
            //         ],
            //       ),
            //       child: const Icon(Icons.arrow_forward_ios),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
    //   Container(
    //   width: context.wp(50),
    //   margin: EdgeInsets.only(right: context.wp(2)),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(16),
    //     color: Colors.white,
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //
    //       /// IMAGE
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(16),
    //         child: CustomImage(
    //            image,
    //           width: double.infinity,
    //           height: context.hp(15),
    //           fit: BoxFit.contain,
    //         ),
    //       ),
    //
    //       SizedBox(height: context.hp(1)),
    //
    //       /// TITLE
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
    //         child: CustomText(
    //           title,
    //           fontSize: 18,
    //           fontWeight: FontWeight.w600,
    //           maxLines: 1,
    //         ),
    //       ),
    //
    //       SizedBox(height: context.hp(0.5)),
    //
    //       /// DESCRIPTION
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
    //         child: CustomText(
    //           description,
    //           fontSize: 14,
    //           color: Colors.black54,
    //           maxLines: 2,
    //         ),
    //       ),
    //
    //       SizedBox(height: context.hp(1.5)),
    //
    //       /// PRICES ROW
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
    //         child: Row(
    //           children: [
    //             CustomText(
    //               price,
    //               fontSize: 18,
    //               fontWeight: FontWeight.bold,
    //             ),
    //             SizedBox(width: context.wp(3)),
    //             CustomText(
    //               oldPrice,
    //               fontSize: 14,
    //               color: Colors.grey,
    //               // decoration: TextDecoration.lineThrough,
    //             ),
    //             SizedBox(width: context.wp(2)),
    //             CustomText(
    //               discount,
    //               fontSize: 14,
    //               color: Colors.red,
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //       SizedBox(height: context.hp(1)),
    //
    //       /// ⭐ RATING + REVIEWS
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: context.wp(3)),
    //         child: Row(
    //           children: [
    //             ...List.generate(
    //               5,
    //                   (index) => Icon(
    //                 Icons.star,
    //                 size: context.sp(16),
    //                 color: index < rating ? Colors.amber : Colors.grey[300],
    //               ),
    //             ),
    //             SizedBox(width: context.wp(2)),
    //             CustomText(
    //               reviews.toString(),
    //               fontSize: 14,
    //               color: Colors.black54,
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //       SizedBox(height: context.hp(1)),
    //
    //       // /// ARROW BUTTON
    //       // Align(
    //       //   alignment: Alignment.centerRight,
    //       //   child: GestureDetector(
    //       //     onTap: onTap,
    //       //     child: Container(
    //       //       margin: EdgeInsets.only(
    //       //           right: context.wp(3), bottom: context.hp(1)),
    //       //       width: context.wp(12),
    //       //       height: context.wp(12),
    //       //       decoration: BoxDecoration(
    //       //         shape: BoxShape.circle,
    //       //         color: Colors.white,
    //       //         boxShadow: [
    //       //           BoxShadow(
    //       //             color: Colors.black12,
    //       //             blurRadius: 6,
    //       //             spreadRadius: 1,
    //       //           )
    //       //         ],
    //       //       ),
    //       //       child: const Icon(Icons.arrow_forward_ios),
    //       //     ),
    //       //   ),
    //       // )
    //     ],
    //   ),
    // );
  }
}
