import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/core/dependency_injection/di_container.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:myapp/screens/product_list/views/product_list_desktop.dart';
import 'package:myapp/screens/product_list/views/product_list_mobile.dart';
import 'package:myapp/screens/product_list/views/product_list_tablet.dart';
import '../../core/responsive/responsive_layout.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  // final List<ProductEntity> data;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  late ProductBloc productBloc;
  TextEditingController searchCtrl = TextEditingController();

  @override
  void initState() {
    productBloc = sl.get()..add(LoadProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile:
          ProductListMobile(productBloc: productBloc, controller: searchCtrl),
      tablet:
          ProductListTablet(productBloc: productBloc, controller: searchCtrl),
      desktop:
          ProductListDesktop(productBloc: productBloc, controller: searchCtrl),
    );
  }
}
