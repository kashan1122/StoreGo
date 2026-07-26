import 'package:flutter/material.dart';
import 'package:myapp/core/responsive/responsive_layout.dart';
import 'package:myapp/presentation/blocs/auth/auth_bloc.dart';
import 'package:myapp/screens/auth/login/views/login_desktop.dart';
import 'package:myapp/screens/auth/login/views/login_mobile.dart';
import 'package:myapp/screens/auth/login/views/login_tablet.dart';

import '../../../core/dependency_injection/di_container.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late LoginBloc loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = sl.get();
  }

  @override
  Widget build(BuildContext context) {
    print("PIXELS: ${MediaQuery.sizeOf(context).height}");

    return ResponsiveLayout(
      mobile: LoginMobile(loginBloc: loginBloc),
      tablet: const LoginTablet(),
      desktop: const LoginDesktop(),
    );
  }
}
