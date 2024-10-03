class RegisterModel {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  // Convert JSON to RegisterModel
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  // Convert RegisterModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}