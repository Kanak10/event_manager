import 'package:event_manager/UI/global_widgets/buttons/em_elevalted_button.dart';
import 'package:event_manager/bloC/auth/bloc/auth_bloc.dart';
import 'package:event_manager/bloC/auth/bloc/auth_event.dart';
import 'package:event_manager/bloC/auth/bloc/auth_state.dart';
import 'package:event_manager/theams/app_colors.dart';
import 'package:event_manager/theams/text_box_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Image.asset("assets/images/app_logo.png", height: 120),

          const SizedBox(height: 25),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: textBoxStyle(hintText: "Enter Email", prefixIcon: Icons.person_outline)
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: passwordController,
                  obscureText: !showPassword,
                  decoration: textBoxStyle(hintText: "Enter Password", prefixIcon: Icons.lock_outline,
                    hasSuffixIcon: true,
                    suffixIcon: IconButton(
                      icon: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => setState(() {
                        showPassword = !showPassword;
                      }),
                    ),
                  )
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  ),
                ),

                const SizedBox(height: 10),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return EMElevatedButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        context.read<AuthBloc>().add(SigninEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ));
                      },
                      child: state is AuthLoadingState
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text("Login", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: whiteColor,
                              fontSize: 16
                            )),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Row(children: const [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("OR"),
            ),
            Expanded(child: Divider()),
          ]),
          const SizedBox(height: 20),

          OutlinedButton.icon(
            onPressed: () {
              context.read<AuthBloc>().add(GoogleSignInEvent());
            },
            icon: const Icon(Icons.g_mobiledata_rounded, size: 34),
            label: const Text("Continue with Google"),
            style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
          ),

          const SizedBox(height: 20),
          const Text("Don't have an account? Sign Up")
        ],
      ),
    );
  }
}
