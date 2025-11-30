import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/core/constants/app_strings.dart';
import 'package:myapp/core/custom_widgets/card.dart';
import 'package:myapp/core/custom_widgets/custom_scaffold.dart';
import 'package:myapp/core/custom_widgets/image.dart';
import 'package:myapp/core/custom_widgets/text.dart';
import 'package:myapp/core/custom_widgets/textformfield.dart';
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

class ProductListDesktop extends StatefulWidget {
  const ProductListDesktop({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ProductListDesktop> createState() => _ProductListDesktopState();
}

class _ProductListDesktopState extends State<ProductListDesktop> {
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state.status == Status.initial) {
            return Column(
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
                const SizedBox(height: 16),

                ///Featured, Sort & Filter Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      AppString.allFeatured,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                    ),

                    Row(
                      children: [
                        CustomText(
                          AppString.allFeatured,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                        const SizedBox(width: 16),
                        CustomText(
                          AppString.allFeatured,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ],
                    )
                  ],
                ),

                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 👉 2 items in a row
                      childAspectRatio: 0.75, // 👉 Adjust height ratio
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];

                      return
                        CustomProductCard(
                          title: product.title,
                          description: product.description,
                          imageUrl: product.image,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    BlocProvider(
                                      create: (context) =>
                                      ProductBloc(
                                          ProductRepositoryImpl(
                                              ProductRemoteDataSource(
                                                  http.Client())))
                                        ..add(LoadProductById(product.id)),
                                      child: ProductDetailView(
                                          postId: product.id),
                                    ),
                              ),
                            );
                          },
                        );
                    },
                  ),
                ),
              ],
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
