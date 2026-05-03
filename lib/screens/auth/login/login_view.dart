import 'package:flutter/material.dart';
import 'package:myapp/core/responsive/responsive_layout.dart';
import 'package:myapp/screens/auth/login/views/login_desktop.dart';
import 'package:myapp/screens/auth/login/views/login_mobile.dart';
import 'package:myapp/screens/auth/login/views/login_tablet.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return const ResponsiveLayout(
      mobile: LoginMobile(),
      tablet: LoginTablet(),
      desktop: LoginDesktop(),
    );
  }
}
