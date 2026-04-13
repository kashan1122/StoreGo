import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar appBar;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: body,
      ),
    );
  }
}
