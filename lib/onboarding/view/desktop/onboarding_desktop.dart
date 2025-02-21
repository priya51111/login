import 'package:flutter/material.dart';

class OnboardingDesktop extends StatefulWidget {
  const OnboardingDesktop({super.key});

  @override
  State<OnboardingDesktop> createState() => _OnboardingDesktopState();
}

class _OnboardingDesktopState extends State<OnboardingDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Welcome Desktop user"),
      ),
    );
  }
}
