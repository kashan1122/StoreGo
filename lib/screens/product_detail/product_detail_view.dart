import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_state.dart';

class ProductDetailView extends StatelessWidget {
  final int postId;
  const ProductDetailView({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state){
            if (state.status == Status.initial) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "state.postData.title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "state.postData.body",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }
            else if (state.status == Status.error) {
              return const Text("Failed to load");
            }
            else if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // 🔥 Fallback widget (required)
            return const Center(
              child: Text("Something went wrong"),
            );
          },

        )

    );
  }
}
