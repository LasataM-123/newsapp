import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newsinfo.dart';
import 'package:newsapp/signUp.dart';
import 'package:newsapp/states/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  String? _emailErr;
  String? _passErr;
  bool _remember = false;
  bool _isLoading = false;
  bool _loginAttempted = false; // 👈 NEW: true only after you press the button

  void _clearErrors() {
    setState(() {
      _emailErr = null;
      _passErr = null;
    });
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context
        .read<AuthCubit>(); // shared cubit (provided in main.dart)

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: BlocConsumer<AuthCubit, AuthState>(
            // only run listener on *state type* changes
            listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
            listener: (context, state) {
              if (state is AuthLoading) {
                setState(() => _isLoading = true);
                return;
              }

              setState(() => _isLoading = false);

              if (state is AuthError) {
                _clearErrors();
                switch (state.type) {
                  case 'email':
                    _emailErr = state.message;
                    break;
                  case 'password':
                    _passErr = state.message;
                    break;
                }
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }

              // ✅ Navigate only if this Authenticated result was triggered by our button press
              if (state is Authenticated && _loginAttempted) {
                _loginAttempted = false; // reset for next time
                _clearErrors();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Welcome ${state.user.email}!')),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsInfo(email: state.user.email ?? " "),
                  ),
                );
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  const Text(
                    'Hello',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                  ),
                  const Text(
                    'Again!',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                    ),
                  ),
                  const Text(
                    'Welcome back you’ve\nbeen missed',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 40),

                  _InputField(
                    label: 'Username',
                    controller: emailCtrl,
                    err: _emailErr,
                  ),
                  const SizedBox(height: 20),
                  _InputField(
                    label: 'Password',
                    controller: passwordCtrl,
                    err: _passErr,
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.blue,
                            value: _remember,
                            onChanged: (v) =>
                                setState(() => _remember = v ?? false),
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  /* -------------- LOGIN BUTTON -------------- */
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              setState(() {
                                _loginAttempted =
                                    true; // 👈 mark that *we* initiated login
                              });
                              authCubit.signIn(
                                emailCtrl.text.trim(),
                                passwordCtrl.text.trim(),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 42),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(child: Text('or continue with')),
                  ),

                  Row(
                    children: [
                      _SocialBtn(
                        icon: Icons.facebook,
                        label: 'Facebook',
                        onTap: () {},
                      ),
                      const SizedBox(width: 20),
                      _SocialBtn(
                        icon: Icons.golf_course,
                        label: 'Google',
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpPage()),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

/* ---------- helpers ---------- */

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
        const SizedBox(height: 6),
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

class _SocialBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _SocialBtn({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEFEFF4),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: color ?? Colors.black),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
