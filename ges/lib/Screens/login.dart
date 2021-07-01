import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ges/Functions/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:ges/Functions/already_have_an_account_acheck.dart';
import 'package:ges/Functions/rounded_button.dart';
import 'package:ges/Functions/rounded_input_field.dart';
import 'package:ges/Functions/rounded_password_field.dart';
import '../theme.dart';
import 'Signup.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03), SvgPicture.asset("lib/assets/login.svg", height: size.height * 0.25,),
              SizedBox(height: size.height * 0.03),
              TextField(
                controller: emailController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.assignment_ind_outlined,
                    color: kPrimaryColor,
                  ),
                  hintText: "e-mail",
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}