import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/constants/brand_colors.dart';

import 'login_form_fields.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.green[800],
                      Colors.green[400],
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Obx(() {
                  if (_authenticationController.isloginState.value) {
                    return Column(
                      children: [
                        SizedBox(height: _height < 686 ? 45 : 120.0),
                        AppLogo(),
                        SizedBox(height: 40.0),
                        WelcomeText(),
                        SizedBox(height: 14.0),
                        EmailTextField(
                            authenticationController:
                                _authenticationController),
                        SizedBox(height: 14.0),
                        PasswordFormField(
                            authenticationController:
                                _authenticationController),
                        SizedBox(height: 40.0),
                        CustomButton(
                          actionText: "LOGIN",
                          authenticationController: _authenticationController,
                        ),
                        SizedBox(height: 40.0),
                        ButtomText(
                          authenticationController: _authenticationController,
                          text: "Don't Have an account? ",
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: _height < 686 ? 45 : 120.0),
                        AppLogo(),
                        SizedBox(height: 40.0),
                        WelcomeText(),
                        SizedBox(height: 14.0),
                        NameTextField(
                            authenticationController:
                                _authenticationController),
                        SizedBox(height: 14.0),
                        EmailTextField(
                            authenticationController:
                                _authenticationController),
                        SizedBox(height: 14.0),
                        PasswordFormField(
                            authenticationController:
                                _authenticationController),
                        SizedBox(height: 14.0),
                        PhoneTextField(
                            authenticationController:
                                _authenticationController),
                        SizedBox(height: 40.0),
                        CustomButton(
                          actionText: "SIGN UP",
                          authenticationController: _authenticationController,
                        ),
                        SizedBox(height: 40.0),
                        ButtomText(
                          authenticationController: _authenticationController,
                          text: "Already have an account? ",
                        ),
                      ],
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtomText extends StatelessWidget {
  const ButtomText({
    Key key,
    @required AuthenticationController authenticationController,
    @required this.text,
  })  : _authenticationController = authenticationController,
        super(key: key);

  final AuthenticationController _authenticationController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          "$text ",
          style: TextStyle(fontSize: 18.0),
        ),
        GestureDetector(
          onTap: () {
            print(_authenticationController.isloginState.value);
            _authenticationController.isloginState.value =
                !_authenticationController.isloginState.value;
          },
          child: Container(
            child: Text(
              'Here',
              style: TextStyle(
                fontSize: 18.0,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                color: BrandColors.kcolorBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome To GTaxi",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25.0,
        fontFamily: "Brand-Bold",
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/logo.png",
        height: 100,
        width: 100,
      ),
    );
  }
}

class AuthenticationController extends GetxController {
  var isloginState = true.obs;
  var email = "mail@mail.com".obs;
  var password = "password".obs;
  var fullName = "Full Name".obs;
  var phoneNumber = "9800918289".obs;
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.actionText,
    @required this.authenticationController,
  }) : super(key: key);

  final String actionText;
  final AuthenticationController authenticationController;

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
        onPressed: () {
          print(authenticationController.email);
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.isPassword,
    @required this.title,
  }) : super(key: key);

  final bool isPassword;
  final String title;

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
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: BrandColors.kcolorLightGray,
          ),
        ),
        prefixIcon: isPassword ? Icon(Icons.lock) : Icon(Icons.email),
        labelText: "$title",
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
