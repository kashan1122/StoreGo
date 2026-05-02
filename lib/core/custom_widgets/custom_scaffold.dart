import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? bottomAppBar;
  final Widget body;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.bottomAppBar,
    required this.body,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: body,
      ),
      bottomNavigationBar: bottomAppBar,
    );
  }
}
