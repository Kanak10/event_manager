import 'package:event_manager/UI/global_widgets/buttons/em_elevalted_button.dart';
import 'package:event_manager/bloC/auth/bloc/auth_bloc.dart';
import 'package:event_manager/bloC/auth/bloc/auth_event.dart';
import 'package:event_manager/bloC/auth/bloc/auth_state.dart';
import 'package:event_manager/theams/app_colors.dart';
import 'package:event_manager/theams/text_box_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final firstController = TextEditingController();
  final lastController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();
  bool showPassword = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Image.asset("assets/images/app_logo.png", height: 120),

          const SizedBox(height: 25),

          TextField(
            controller: firstController,
            decoration: textBoxStyle(hintText: "Enter First Name", prefixIcon: Icons.person_outline)
          ),

          const SizedBox(height: 12),

          TextField(
            controller: lastController,
            decoration: textBoxStyle(hintText: "Enter Last Name", prefixIcon: Icons.person_outline)
          ),

          const SizedBox(height: 12),

          TextField(
            controller: emailController,
            decoration: textBoxStyle(hintText: "Enter Email", prefixIcon: Icons.email_outlined)
          ),

          const SizedBox(height: 12),

          TextField(
            controller: passController,
            obscureText: !showPassword,
            decoration: textBoxStyle(hintText: "Enter Password", prefixIcon: Icons.email_outlined,
              hasSuffixIcon: true,
              suffixIcon: IconButton(
                icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() {
                  showPassword = !showPassword;
                }),
              )
            )
          ),

          const SizedBox(height: 12),

          TextField(
            controller: confirmController,
            obscureText: !showConfirm,
            decoration: textBoxStyle(hintText: "Enter Confirm Password", prefixIcon: Icons.email_outlined,
              hasSuffixIcon: true,
              suffixIcon: IconButton(
                icon: Icon(showConfirm ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() {
                  showConfirm = !showConfirm;
                }),
              )
            )
          ),

          const SizedBox(height: 22),

          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return EMElevatedButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  context.read<AuthBloc>().add(SignUpEvent(
                        firstName: firstController.text.trim(),
                        lastName: lastController.text.trim(),
                        email: emailController.text.trim(),
                        password: passController.text.trim(),
                        confirmPassword: confirmController.text.trim(),
                      ));
                },
                child: state is AuthLoadingState
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text("Sign Up", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: whiteColor,
                        fontSize: 16
                      )),
              );
            },
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
            label: const Text("Signup with Google"),
            style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
          ),
        ],
      ),
    );
  }
}
