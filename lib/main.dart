import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/create_account.dart';
import 'package:login/login_page.dart';
import 'package:login/onboarding_screen.dart';
    

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 
  final GoRouter _router = GoRouter(
    initialLocation: '/onboard',
    routes: [
      GoRoute(
        path: '/onboard',
        builder: (context, state) =>OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/createaccount',
        builder: (context, state) => CreateAccountScreen(),
      ),
      
    ],
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
         routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    
    );
  }
}

