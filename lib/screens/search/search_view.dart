import 'package:flutter/material.dart';
import 'package:myapp/presentation/blocs/search/search_bloc.dart';
import 'package:myapp/screens/search/views/search_desktop.dart';
import 'package:myapp/screens/search/views/search_mobile.dart';
import 'package:myapp/screens/search/views/search_tablet.dart';
import '../../core/dependency_injection/di_container.dart';
import '../../core/responsive/responsive_layout.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  late SearchBloc searchBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBloc = sl.get();
  }
  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: SearchMobile(searchBloc: searchBloc),
      tablet: const SearchTablet(),
      desktop: SearchDesktop(),
    );
  }
}
