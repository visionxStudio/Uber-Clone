import 'package:flutter/material.dart';
import 'package:uberclone/constants/brand_colors.dart';
import 'package:uberclone/controllers/Auth_controller.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key key,
    @required AuthController authController,
  })  : _authController = authController,
        super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Container(
      height: _height <= 686 ? _height * 0.08 : _height * 0.065,
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authController.password.value = value;
        },
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
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
    @required AuthController authController,
  })  : _authController = authController,
        super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Container(
      height: _height <= 686 ? _height * 0.08 : _height * 0.065,
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authController.email.value = value;
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
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
    @required AuthController authController,
  })  : _authenticationController = authController,
        super(key: key);

  final AuthController _authenticationController;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Container(
      height: _height <= 686 ? _height * 0.08 : _height * 0.065,
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authenticationController.fullName.value = value;
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
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key key,
    @required AuthController authController,
  })  : _authController = authController,
        super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Container(
      height: _height <= 686 ? _height * 0.08 : _height * 0.065,
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authController.phoneNumber.value = value;
        },
        obscureText: false,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          focusColor: BrandColors.kcolorAccent,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: BrandColors.kcolorAccent,
            ),
          ),
          // fillColor: Colors.grey,
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
          labelText: "Mobile Number",
          labelStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
