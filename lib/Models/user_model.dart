import 'package:flutter/cupertino.dart';

class UserModel {
  String fullName = "";
  String email = "";
  String password = "";
  var phone = "";

  UserModel({
    @required this.email,
    @required this.fullName,
    @required this.password,
    @required this.phone,
  });
}
