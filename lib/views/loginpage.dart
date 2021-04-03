import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberclone/constants/brand_colors.dart';

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
                        Text(
                          "Welcome To GTaxi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "Brand-Bold",
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          color: Colors.grey[200],
                          child: TextField(
                            onChanged: (value) {
                              print(value);
                            },
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
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
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          color: Colors.grey[200],
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
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
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        LoginButton(actionText: "LOGIN"),
                        SizedBox(height: 40.0),
                        Wrap(
                          children: [
                            Text(
                              "Don't have an account? Sign up ",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                print(_authenticationController
                                    .isloginState.value);
                                _authenticationController.isloginState.value =
                                    !_authenticationController
                                        .isloginState.value;
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
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: _height < 686 ? 45 : 120.0),
                        AppLogo(),
                        SizedBox(height: 40.0),
                        Text(
                          "Welcome To GTaxi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "Brand-Bold",
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          color: Colors.grey[200],
                          child: TextField(
                            obscureText: false,
                            keyboardType: TextInputType.text,
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
                              prefixIcon: Icon(Icons.account_box),
                              labelText: "Full Name",
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          color: Colors.grey[200],
                          child: TextField(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
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
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          color: Colors.grey[200],
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
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
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Container(
                          color: Colors.grey[200],
                          child: TextField(
                            obscureText: false,
                            keyboardType: TextInputType.number,
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
                              prefixIcon: Icon(Icons.phone),
                              labelText: "Phone Number",
                              labelStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        LoginButton(actionText: "SIGN UP"),
                        SizedBox(height: 40.0),
                        Wrap(
                          children: [
                            Text(
                              "Already have an account? Login up ",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                print(_authenticationController
                                    .isloginState.value);
                                _authenticationController.isloginState.value =
                                    !_authenticationController
                                        .isloginState.value;
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
