import 'package:flutter/material.dart';
import 'package:myapp/presentation/blocs/product/product_bloc.dart';
import 'package:myapp/presentation/blocs/product/product_event.dart';
import 'package:myapp/screens/home/views/home_desktop.dart';
import 'package:myapp/screens/home/views/home_mobile.dart';
import 'package:myapp/screens/home/views/home_tablet.dart';
import '../../core/dependency_injection/di_container.dart';
import '../../core/responsive/responsive_layout.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late ProductBloc productBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc = sl.get()..add(LoadProducts());
  }
  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: HomeMobile(title: widget.title, productBloc: productBloc),
      tablet: HomeTablet(title: widget.title),
      desktop: HomeDesktop(title: widget.title),
    );
  }
}
