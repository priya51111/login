import 'package:flutter/material.dart';
import 'package:login/onboarding/view/desktop/onboarding_desktop.dart';
import 'package:login/onboarding/view/mobile/onboarding_mobile.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveValue<Widget>(
      context,
      defaultValue: const OnboardingMobile(),
      conditionalValues: [
        const Condition.equals(
          name: DESKTOP,
          value: OnboardingDesktop(),
        ),
        const Condition.smallerThan(
          name: DESKTOP,
          value: OnboardingMobile(),
        ),
      ],
    ).value;
  }
}
