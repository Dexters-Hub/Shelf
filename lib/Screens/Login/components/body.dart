import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Screens/Login/components/background.dart';
import 'package:shelf/Screens/Signup/signup_screen.dart';
import 'package:shelf/components/already_have_an_account.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:shelf/components/rounded_input_field.dart';
import 'package:shelf/components/rounded_password_field.dart';

import 'package:shelf/providers/login_auth.dart';
import 'package:shelf/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .012,
                      horizontal: MediaQuery.of(context).size.width * .078),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .012,
                      horizontal: MediaQuery.of(context).size.width * .078),
                  child: Text(
                    "Sign into your account",
                    style: TextStyle(
                        color: Color(0xff788190),
                        fontSize: SizeConfig.safeBlockHorizontal * 2.9,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.045),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .012,
                      horizontal: MediaQuery.of(context).size.width * .078),
                  child: Text(
                    "Your Email",
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            RoundedInputField(
                controller: emailController,
                icon: Icons.email_outlined,
                hintText: "myemail@gmail.com",
                onChanged: (value) {}),
            SizedBox(height: size.height * 0.025),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .012,
                      horizontal: MediaQuery.of(context).size.width * .078),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            RoundedPasswordField(
                controller: passwordController, onChanged: (value) {}),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
            //       child: Text(
            //         "Forgot Password?",
            //         style:
            //             TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: size.height * 0.075),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            ),
            RoundedButton(
                text: "Login",
                press: () async {
                  // ignore: unused_local_variable
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  signIn(
                      context, emailController.text, passwordController.text);
                }),
          ],
        ),
      ),
    );
  }
}
