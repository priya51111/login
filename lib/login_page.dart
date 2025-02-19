import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -376,
              left: 114,
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xFFF8F9FF), 
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
                    color: Color(0xFFF8F9FF), 
                    width: 3,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Login here",
                          style: TextStyle(
                              fontSize: 35,
                              color: Color(0xFF1F41BB),
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Welcome back you've\n been missed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 32),
                        FormBuilderTextField(
                          name: "email",
                          decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            fillColor: Color(0xFFF1F4FF),
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
                                  color: Color(0xFF1F41BB), width: 2),
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
                            fillColor: Color(0xFFF1F4FF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide
                                  .none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide
                                  .none, 
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color(0xFF1F41BB),
                                  width: 2),
                            ),
                          ),
                          validator: (value) =>
                              value == null || value.length < 6
                                  ? "Password must be at least 6 characters"
                                  : null,
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Color(0xFF1F41BB),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                debugPrint(
                                    "Form Valid: ${_formKey.currentState?.value}");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1F41BB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Sign In",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Create new  account",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 70),
                        const Text(
                          "Or continue with",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1F41BB),
                              fontWeight: FontWeight.bold),
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
  }
}

Widget socialButton(String assetPath) {
  return Container(
    width: 45,
    height: 35,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xFFECECEC),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
        ),
      ],
    ),
    child: Image.asset(
      assetPath,
      fit: BoxFit.contain,
      height: 24,
      width: 24,
    ),
  );
}
