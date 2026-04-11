import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/constants/app_font.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/custom_widgets/textformfield.dart';
import 'package:myapp/core/responsive/size_extention.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_state.dart';
import 'package:myapp/screens/home/widgets/carousel_slider.dart';
import 'package:myapp/screens/home/widgets/deal_container.dart';
import 'package:myapp/screens/home/widgets/new_arrival_card.dart';
import 'package:myapp/screens/home/widgets/offer_container.dart';
import 'package:myapp/screens/home/widgets/promo_banner.dart';
import 'package:myapp/screens/home/widgets/sponsored_card.dart';
import '../widgets/product_card.dart';

class HomeTablet extends StatefulWidget {
  const HomeTablet({super.key, required this.title});
  final String title;

  @override
  State<HomeTablet> createState() => _HomeTabletState();
}

class _HomeTabletState extends State<HomeTablet> {
  TextEditingController searchCtrl = TextEditingController();

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
                    onTap: (){
                      context.push("/search");
                    },
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
                                  offset: const Offset(0,
                                      2), // Shifts the shadow down by 3 pixels
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
                                  offset: const Offset(0,
                                      2), // Shifts the shadow down by 3 pixels
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
                  SizedBox(
                    height: context.hp(1),
                  ),

                  ///Category slider
                  Container(
                    height: context.hp(15), // height for the whole container
                    // color: Colors.red,
                    child: PageView.builder(
                      padEnds: false,
                      itemCount: 5,
                      // number of pages
                      controller: PageController(viewportFraction: 0.33),
                      // controller: _pageViewController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Circle Image
                              CircleAvatar(
                                radius: context.wp(8),
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage:
                                NetworkImage(state.products[index].image),
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

                  SizedBox(
                    height: context.hp(1),
                  ),

                  const BannerCarousel(),

                  SizedBox(
                    height: context.hp(2),
                  ),

                  DealContainer(
                    color: Colors.blue,
                    title: AppString.dealsOfTheDay,
                    subTitle: AppString.timeRemaining,
                    onPress: () {
                      context.push('/product_list', extra: state.products);
                    },
                  ),
                  SizedBox(
                    height: context.hp(2),
                  ),

                  SizedBox(
                    height: context.hp(40),
                    child: PageView.builder(
                      padEnds: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      controller: PageController(viewportFraction: 0.6),
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        final p = product;
                        return ProductHorizontalCard(
                          productEntity: p,
                          oldPrice: "30",
                          discount: "10",
                          rating: 5.00,
                          reviews: 5,
                          onTap: () {
                            context.push('/product_detail', extra: p);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.hp(2),
                  ),
                  const OfferContainer(
                      "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png"),

                  SizedBox(
                    height: context.hp(2),
                  ),
                  PromoBanner(
                    title: "Flat and Heels",
                    subtitle: "Stand a chance to get rewarded",
                    buttonText: "Visit now",
                    image:
                    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
                    buttonColor: const Color(0xffE34850),
                    onTap: () {
                      print("Clicked banner");
                    },
                  ),

                  SizedBox(
                    height: context.hp(2),
                  ),
                  DealContainer(
                    color: const Color(0xffFD6E87),
                    title: AppString.trendingProducts,
                    subTitle: "${AppString.lastDate} 29/02/22",
                    onPress: () {},
                  ),

                  SizedBox(
                    height: context.hp(2),
                  ),

                  SizedBox(
                    height: context.hp(35),
                    child: PageView.builder(
                      padEnds: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.products.length,
                      controller: PageController(viewportFraction: 0.6),
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        final p = product;
                        return ProductHorizontalCard(
                          productEntity: p,
                          isShowRating: false,
                          oldPrice: "30",
                          discount: "10",
                          rating: 5.00,
                          reviews: 5,
                          onTap: () {},
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: context.hp(2),
                  ),

                  NewArrival(
                    imageUrl:
                    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png",
                    title: "New Arrivals",
                    subtitle: "Summer’ 25 Collections",
                    onTap: () {
                      print("View all tapped!");
                    },
                  ),

                  SizedBox(
                    height: context.hp(2),
                  ),

                  SponsoredCard(
                    imageUrl:
                    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png",
                    title: "up to 50% Off",
                    onTap: () {
                      print("Clicked");
                    },
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
  }
}
