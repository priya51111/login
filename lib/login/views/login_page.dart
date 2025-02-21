import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/login/bloc/login_bloc.dart';
import 'package:login/login/views/desktop/login_desktop.dart';
import 'package:login/login/views/mobile/login_mobile.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(InitializeLogin()),
      child: ResponsiveValue<Widget>(
        context,
        defaultValue: const LoginMobile(),
        conditionalValues: [
          const Condition.equals(
            name: DESKTOP,
            value: LoginDesktop(),
          ),
          const Condition.smallerThan(
            name: DESKTOP,
            value: LoginMobile(),
          ),
        ],
      ).value,
    );
  }
}
