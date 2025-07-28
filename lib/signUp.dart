import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/country.dart';
import 'package:newsapp/states/bloc/auth_bloc.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();

  String? _emailErr;
  String? _passErr;
  bool   isLoading = false;

  void _clearErrors() {
    setState(() {
      _emailErr = null;
      _passErr  = null;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 👉 use the cubit that MyApp provided—DON’T create a new one
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: BlocConsumer<AuthCubit, AuthState>(
            // 🔑 fire the listener **only** after the button triggers loading
            listenWhen: (previous, current) =>
            (previous is AuthLoading && current is Authenticated) ||
                (previous is AuthLoading && current is AuthError),

            listener: (context, state) {
              if (state is Authenticated) {
                setState(() => isLoading = false);
                _clearErrors();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account created successfully!')),
                );
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Country()));  
              } else if (state is AuthError) {
                setState(() => isLoading = false);
                switch (state.type) {
                  case 'email':
                    _emailErr = state.message;
                    break;
                  case 'password':
                    _passErr  = state.message;
                    break;
                  default:
                    _clearErrors();
                }
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },

            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Create',
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900)),
                  const Text('Account',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue)),
                  const Text('Sign up to get started',
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 40),

                  _InputField(label: 'Username', controller: emailController, err: _emailErr),
                  const SizedBox(height: 20),
                  _InputField(label: 'Password', controller: passwordController, err: _passErr, isPassword: true),

                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 42),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () => authCubit.signUp(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "or continue with",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              238,
                              241,
                              244,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.facebook, size: 25, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                "Facebook",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              238,
                              241,
                              244,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.golf_course, size: 25),
                              SizedBox(width: 10),
                              Text(
                                "Google",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text('Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/* ---------- Small input widget ---------- */

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? err;
  final bool isPassword;

  const _InputField({
    required this.label,
    required this.controller,
    this.err,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: const TextStyle(fontSize: 16)),
            const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            errorText: err,
            suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
          ),
        ),
      ],
    );
  }
}