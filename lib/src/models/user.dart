class User {
  String email;
  String password;
  User({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };

    return map;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['request']['email'],
      password: json['request']['password'],
    );
  }
}

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}
