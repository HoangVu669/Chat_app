import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/signUp_page.dart';
import 'package:flutter/material.dart';

class LogInOrSignUp extends StatefulWidget {
  const LogInOrSignUp({super.key});

  @override
  State<LogInOrSignUp> createState() => _LogInOrSignUpState();
}

class _LogInOrSignUpState extends State<LogInOrSignUp> {

  bool showLoginPage = true;

  void tongglepages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: tongglepages,
      );
    }else{
      return SignUpPage(
        onTap: tongglepages,
      );
    }
  }
}
