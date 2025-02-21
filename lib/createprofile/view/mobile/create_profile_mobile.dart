import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:login/createprofile/bloc/create_profile_bloc.dart';

class CreateProfileMobile extends StatefulWidget {
  const CreateProfileMobile({super.key});

  @override
  State<CreateProfileMobile> createState() => _CreateProfileMobileState();
}

final _formKey = GlobalKey<FormBuilderState>();
final log = Logger();

class _CreateProfileMobileState extends State<CreateProfileMobile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProfileBloc, CreateProfileState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.status == CreateProfileStatus.success) {
         
          context.go("/homepage");
           ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User Created')),
    );
        }
        if (state.status == CreateProfileStatus.failure) {
          
            ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('state.message ')),
    );
          log.e("LoginMobile::LoginStatus:Error: ${state.message}");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Stack(
            children: [
              Positioned(
                top: -356,
                left: 114,
                child: Container(
                  width: 635,
                  height: 635,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
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
                        color:
                            Theme.of(context).colorScheme.surfaceContainerLow,
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
                        context.read<CreateProfileBloc>().add(
                            OnChangeFormValue(_formKey.currentState!.value));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Create Account",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Create an account so you can explore all the\n existing jobs",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
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
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerLow,
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
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => value == null || value.isEmpty
                                ? "Enter email"
                                : null,
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
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerLow,
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
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              ),
                            ),
                            validator: (value) =>
                                value == null || value.length < 6
                                    ? "Password must be at least 6 characters"
                                    : null,
                          ),
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: "confirm_password",
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              filled: true,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerLow,
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
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2),
                              ),
                            ),
                            validator: (value) {
                              final password = _formKey.currentState
                                  ?.fields['password']?.value as String?;
                              if (value == null || value.isEmpty) {
                                return "Confirm your password";
                              } else if (value != password) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  context
                                      .read<CreateProfileBloc>()
                                      .add(SubmitProfile());
                                }
                              },
                              child: Text(
                                "Sign up",
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          TextButton(
                            onPressed: () {
                              context.go('/login');
                            },
                            child: Text(
                              "Already have an account",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
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
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
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
          ),
        );
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
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        height: 24,
        width: 24,
      ),
    );
  }
}
