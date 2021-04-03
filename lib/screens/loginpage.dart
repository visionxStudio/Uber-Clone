import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/constants/brand_colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 120.0),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                "Sign in as a Rider",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Brand-Bold",
                ),
              ),
              SizedBox(height: 14.0),
              Container(
                  color: Colors.grey[200],
                  child: CustomTextField(isPassword: false)),
              SizedBox(height: 14.0),
              Container(
                  color: Colors.grey[200],
                  child: CustomTextField(isPassword: true)),
              SizedBox(height: 40.0),
              LoginButton(actionText: "LOGIN"),
              SizedBox(height: 40.0),
              Wrap(
                children: [
                  Text("Don't have an account? Sign up "),
                  Text(
                    'Here',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      color: BrandColors.kcolorBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthenticationController extends GetxController {
  var login = true.obs;
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    @required this.actionText,
  }) : super(key: key);

  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: BrandColors.kcolorAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          "$actionText",
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () {},
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.isPassword,
  }) : super(key: key);

  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword ? true : false,
      keyboardType:
          isPassword ? TextInputType.text : TextInputType.emailAddress,
      decoration: InputDecoration(
        focusColor: BrandColors.kcolorAccent,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.kcolorAccent,
          ),
        ),
        fillColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: isPassword ? "........" : "mail@mail.com",
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.kcolorLightGray,
          ),
        ),
        // hintStyle: TextStyle(color: BrandColors.kcolorAccent),
        prefixIcon: isPassword ? Icon(Icons.lock) : Icon(Icons.email),
        labelText: isPassword ? "Password" : "Email Address",
        labelStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
        ),
      ),
      style: TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}
