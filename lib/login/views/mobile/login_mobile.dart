

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:login/login/bloc/login_bloc.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final _formKey = GlobalKey<FormBuilderState>();
  final log = Logger();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          //Todo ::  navigate to home page
          context.go("/onboard");
        }
        if (state.status == LoginStatus.failure) {
          //Todo ::  show message
          log.e("LoginMobile::LoginStatus:Error: ${state.message}");
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Stack(
              children: [
                Positioned(
                  top: -376,
                  left: 114,
                  child: Container(
                    width: 600,
                    height: 600,
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
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SingleChildScrollView(
                      child: FormBuilder(
                        key: _formKey,
                        onChanged: () {
                          _formKey.currentState?.save();
                          context.read<LoginBloc>().add(OnChangeFormValue(_formKey.currentState!.value));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Login here",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700, fontSize: 24),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Welcome back you've\n been missed",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                            const SizedBox(height: 32),
                            FormBuilderTextField(
                              name: "email",
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 14, fontWeight: FontWeight.w400),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => value == null || value.isEmpty ? "Enter email" : null,
                            ),
                            const SizedBox(height: 16),
                            FormBuilderTextField(
                              name: "password",
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Password',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 14, fontWeight: FontWeight.w400),
                                fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                                ),
                              ),
                              validator: (value) => value == null || value.length < 6 ? "Password must be at least 6 characters" : null,
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot your password?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: FilledButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() == true) {
                                      context.read<LoginBloc>().add(SubmitLogin());
                                    }
                                  },
                                  child: Text(
                                    "Sign in ",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextButton(
                              onPressed: () {
                                context.go('/createaccount');
                              },
                              child: Text(
                                "Create new  account",
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 70),
                            Text(
                              "Or continue with",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                socialButton("assets/google.png"),
                                const SizedBox(width: 12),
                                socialButton("assets/facebook.png"),
                                const SizedBox(width: 12),
                                socialButton("assets/apple.png"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  Widget socialButton(String assetPath) {
    return Container(
      width: 45,
      height: 35,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outlineVariant,
            blurRadius: 2,
          ),
        ],
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        height: 24,
        width: 24,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
