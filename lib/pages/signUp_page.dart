import 'package:chat_app/services/auth/auth_services.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final void Function()? onTap;

  SignUpPage({super.key, this.onTap});

  void SignUp(BuildContext context) async {
    final authService = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(
            height: 50,
          ),

          //welcome back
          Text(
            "Welcome back, you've been missed",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          const SizedBox(
            height: 10,
          ),

          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),

          const SizedBox(
            height: 10,
          ),

          MyTextField(
            hintText: "Confirm password",
            obscureText: true,
            controller: _confirmpasswordController,
          ),

          const SizedBox(
            height: 25,
          ),

          MyButton(
            text: "Sign Up",
            onTap: () => SignUp(context),
          ),

          const SizedBox(
            height: 25,
          ),

          //sign up now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Log in now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
