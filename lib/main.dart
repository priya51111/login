import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/common/constans.dart';
import 'package:login/common/ui_helper.dart';

import 'package:login/createprofile/view/create_profile_page.dart';
import 'package:login/grid/pluto_grid.dart';
import 'package:login/home_page.dart';
import 'package:login/login/views/login_page.dart';
import 'package:login/onboarding/view/onboarding_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/plutogrid',
    routes: [
       GoRoute(
        path: '/plutogrid',
        builder: (context, state) => StudentTable(),
      ),
      GoRoute(
        path: '/onboard',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/createaccount',
        builder: (context, state) => CreateProfilePage(),
      ),
      GoRoute(
        path: '/homepage',
        builder: (context, state) => HomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    UiHelper uiHelper = UiHelper();
    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 375, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      routerConfig: _router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: uiHelper.themeData(Constants.themeConfig.LIGHT),
    );
  }
}
