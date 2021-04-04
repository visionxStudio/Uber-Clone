import 'package:flutter/material.dart';
import 'package:uberclone/constants/brand_colors.dart';

import 'loginpage.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key key,
    @required AuthenticationController authenticationController,
  })  : _authenticationController = authenticationController,
        super(key: key);

  final AuthenticationController _authenticationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authenticationController.password.value = value;
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
    @required AuthenticationController authenticationController,
  })  : _authenticationController = authenticationController,
        super(key: key);

  final AuthenticationController _authenticationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authenticationController.email.value = value;
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
    @required AuthenticationController authenticationController,
  })  : _authenticationController = authenticationController,
        super(key: key);

  final AuthenticationController _authenticationController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    @required AuthenticationController authenticationController,
  })  : _authenticationController = authenticationController,
        super(key: key);

  final AuthenticationController _authenticationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: TextField(
        onChanged: (value) {
          _authenticationController.phoneNumber.value = value;
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
