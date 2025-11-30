import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/card.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/custom_widgets/textformfield.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/core/theme/theme_bloc/theme_bloc.dart';
import 'package:myapp/core/theme/theme_bloc/theme_event.dart';
import 'package:myapp/data/repositories/local/local_data_repo.dart';
import 'package:myapp/data/repositories/remote/remote_data_repo.dart';
import 'package:myapp/data/source/product_api.dart';
import 'package:myapp/domain/repositories/product_repostory.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:myapp/presentation/blocs/product/product_state.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/screens/product_detail/product_detail_view.dart';
import 'package:myapp/screens/product_list/widgets/carousel_slider.dart';
import 'package:myapp/screens/product_list/widgets/deal_container.dart';
import 'package:myapp/screens/product_list/widgets/product_card.dart';

class ProductListMobile extends StatefulWidget {
  const ProductListMobile({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ProductListMobile> createState() => _ProductListMobileState();
}

class _ProductListMobileState extends State<ProductListMobile> {
  TextEditingController searchCtrl = TextEditingController();
  PageController _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state.status == Status.initial) {
            return SingleChildScrollView(
              child: Column(
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
                        AppString.allFeatured,
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
                  SizedBox(height: context.hp(1),),

                  ///Category slider
                  Container(
                    height: context.hp(15), // height for the whole container
                    // color: Colors.red,
                    child: PageView.builder(
                      padEnds: false,
                      itemCount: 5, // number of pages
                      controller: PageController(viewportFraction: 0.33),
                      // controller: _pageViewController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Circle Image
                              CircleAvatar(
                                radius: context.wp(8),
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage: NetworkImage(state.products[index].image),
                              ),

                              SizedBox(height: context.hp(0.5)),

                              CustomText(
                                state.products[index].category,
                                fontSize: 12,
                                fontFamily: AppFonts.montserratRegular,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ],
                        ),
                          );
                      },
                    ),
                  ),

                  SizedBox(height: context.hp(1),),

                  const BannerCarousel(),

                  SizedBox(height: context.hp(2),),

                  const DealContainer(),
                  SizedBox(height: context.hp(2),),


                  SizedBox(
                    height: context.hp(40),
                    child: PageView.builder(
                      padEnds: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      controller: PageController(viewportFraction: 0.6),
                      // controller: _pageViewController,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        final p = product;
                        return ProductHorizontalCard(
                          image: p.image,
                          title: p.title,
                          description: p.description,
                          price: "20",
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
              ),
            );
          } else if (state.status == Status.error) {
            return const Text("Failed to load");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
    //   Scaffold(
    //     backgroundColor: AppColors.primary.withOpacity(0.9),
    //
    //     body:
    // );
  }
}
