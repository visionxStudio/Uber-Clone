import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/Helpers/responsive_helper.dart';
import 'package:uberclone/constants/brand_colors.dart';
import 'package:uberclone/controllers/Auth_controller.dart';
import 'package:uberclone/services/authentication_services.dart';

import 'login_form_fields.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    final _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
                if (_authController.isloginState.value) {
                  return Column(
                    children: [
                      SizedBox(height: _height < 686 ? 45 : 120.0),
                      AppLogo(),
                      SizedBox(height: 40.0),
                      WelcomeText(),
                      SizedBox(height: 14.0),
                      EmailTextField(authController: _authController),
                      SizedBox(height: 14.0),
                      PasswordFormField(authController: _authController),
                      SizedBox(height: 40.0),
                      CustomButton(
                        actionText: "LOGIN",
                        authenticationController: _authenticationController,
                      ),
                      SizedBox(height: 40.0),
                      ButtomText(
                        authController: _authController,
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
                      NameTextField(authController: _authController),
                      SizedBox(height: 14.0),
                      EmailTextField(authController: _authController),
                      SizedBox(height: 14.0),
                      PasswordFormField(authController: _authController),
                      SizedBox(height: 14.0),
                      PhoneTextField(authController: _authController),
                      SizedBox(height: 40.0),
                      CustomButton(
                        actionText: "SIGN UP",
                        authenticationController: _authenticationController,
                      ),
                      SizedBox(height: 40.0),
                      ButtomText(
                        authController: _authController,
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
    );
  }
}

class ButtomText extends StatelessWidget {
  const ButtomText({
    Key key,
    @required AuthController authController,
    @required this.text,
  })  : _authController = authController,
        super(key: key);

  final AuthController _authController;
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
            print(_authController.isloginState.value);
            _authController.isloginState.value =
                !_authController.isloginState.value;
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
  var isLoading = false.obs;

  void toggleLoadingState() {
    isLoading(!isLoading.value);
  }
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
    AuthenticationServices _authenticationServices = AuthenticationServices();

    return Container(
      height: 50.0,
      width: authenticationController.isLoading.value ? 80 : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: BrandColors.kcolorAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                authenticationController.isLoading.value ? 10 : 30.0),
          ),
        ),
        child: Obx(() {
          return authenticationController.isLoading.value
              ? Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              : Text(
                  "$actionText",
                  style: TextStyle(fontSize: 20.0),
                );
        }),
        onPressed: () {
          if (authenticationController.isloginState.value) {
            authenticationController.toggleLoadingState();
            _authenticationServices.signupUserWithEmailAndPassword();
            authenticationController.toggleLoadingState();
          }
        },
      ),
    );
  }
}
