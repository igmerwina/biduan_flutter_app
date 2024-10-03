class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  // Convert JSON to LoginModel
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  // Convert LoginModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}