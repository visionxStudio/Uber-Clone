import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/constants/brand_colors.dart';
import 'package:uberclone/controllers/Auth_controller.dart';
import 'package:uberclone/services/authentication_services.dart';

import 'login_form_fields.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final AuthController _authController = Get.put(AuthController());

  // final AuthController _authenticationController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: _height * 0.22,
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
                      SizedBox(
                          height:
                              _height < 686 ? _height * 0.06 : _height * 0.11),
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
                        authenticationController: _authController,
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
                      SizedBox(
                          height:
                              _height < 686 ? _height * 0.06 : _height * 0.11),
                      AppLogo(),
                      SizedBox(height: 40.0),
                      WelcomeText(),
                      SizedBox(height: 14.0),
                      EmailTextField(authController: _authController),
                      SizedBox(height: 14.0),
                      PasswordFormField(authController: _authController),
                      SizedBox(height: 14.0),
                      NameTextField(authController: _authController),
                      SizedBox(height: 14.0),
                      PhoneTextField(authController: _authController),
                      SizedBox(height: _height <= 686 ? 20 : 40.0),
                      CustomButton(
                        actionText: "SIGN UP",
                        authenticationController: _authController,
                      ),
                      SizedBox(height: _height <= 686 ? 20 : 40.0),
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
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Wrap(
      children: [
        Text(
          "$text ",
          style: TextStyle(fontSize: _height <= 686 ? 15 : 18.0),
        ),
        GestureDetector(
          onTap: () {
            // TODO
            _authController.isloginState.value =
                !_authController.isloginState.value;
          },
          child: Container(
            child: Text(
              'Here',
              style: TextStyle(
                fontSize: _height <= 686 ? 15 : 18.0,
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
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Text(
      "Welcome To GTaxi",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: _height <= 686 ? 20 : 25.0,
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.actionText,
    @required this.authenticationController,
  }) : super(key: key);

  final String actionText;
  final AuthController authenticationController;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    AuthenticationServices _authenticationServices = AuthenticationServices();

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: authenticationController.isLoading.value
          ? 50
          : MediaQuery.of(context).size.width * 1,
      child: Container(
        height: _height <= 686 ? _height * 0.080 : _height * 0.065,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: BrandColors.kcolorAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  authenticationController.isLoading.value ? 50 : 30.0),
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
              // perform the login here
              print("login");
            } else {
              // Perform the signup in here
              print("signup");
              _authenticationServices.signupUserWithEmailAndPassword();
            }
          },
        ),
      ),
    );
  }
}
