import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Positioned(
            top: -327,
            left: 148,
            child: Container(
              width: 635,
              height: 635,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryFixed,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -171,
            left: 23,
            child: Container(
              width: 496,
              height: 496,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  width: 3,
                ),
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: -262,
            child: Container(
              width: 372,
              height: 372,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  width: 2,
                ),
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: -217.48,
            child: Transform.rotate(
              angle: -50,
              child: Container(
                width: 372,
                height: 372,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    child: Image.asset(
                      'assets/welcome image.png',
                      height: 422,
                      width: 385,
                    ),
                  ),
                  Text(
                    'Discover Your\nDream Job here',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Explore all the existing job roles based on your interest and study major",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(height: 62),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: Text(
                          "Login",
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          context.go('/createaccount');
                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
