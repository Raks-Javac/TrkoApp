import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:trko/src/models/user.dart';
import 'package:http/http.dart' as http;

class Auth extends Model {
  /// Wraps [ScopedModel.of] for this [Model].
  static Auth of(BuildContext context) => ScopedModel.of<Auth>(context);

  User _user = User();

  String emailCondition({String val}) {
    return (val.isEmpty || !val.contains('@') || val.length < 8)
        ? "Enter a valid email"
        : null;
  }

  String get email => _user.email;
  String get password => _user.password;

  Function emailValidator() {
    String val = "";
    return setEmail(val: val);
  }

  String passwordCondition({String val}) {
    return (val.isEmpty || val.length < 8) ? "Enter a valid password" : null;
  }

  String confirmPasswordCondition({String val, User user}) {
    return (val != user.password || val.isEmpty)
        ? "Check Password and re-type Password"
        : null;
  }

  //this method sets the value in the text field to the object email in the User class
  setEmail({String val}) {
    _user.email = val;
    notifyListeners();
  }

//this method sets the value in the text field to the object password in the User class
  setPassword({String val}) {
    _user.password = val;
    notifyListeners();
  }

  Future<User> login(String email, String password) async {
    String url = "https://api.uatdrive.com:1001/api/v1/users/login/";
    final response = await http.post(url,
        body: json.encode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      return null;
    } else {
      return null;
    }
  }

  Future<User> register(String email, String password) async {
    String url = "https://api.uatdrive.com:1001/api/v1/users";
    final response = await http.post(url,
        body: json.encode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
