class UserAccount {
  int? id;          // DB se auto-generate hoti hai
  String username;
  String password;
  String phone;

  UserAccount({
    this.id,
    required this.username,
    required this.password,
   required this.phone,
  });

  // JSON → Model (API se data aane par)
  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  // Model → JSON (API ko data bhejne ke liye)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'phone': phone,
    };
  }
}
