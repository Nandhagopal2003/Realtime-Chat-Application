// lib/model/chat_user.dart

class ChatUser {
  final String password;
  final String area;
  final int dob;
  final String name;
  final String office;
  final String email;

  ChatUser({
    required this.password,
    required this.area,
    required this.dob,
    required this.name,
    required this.office,
    required this.email,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      password: json['password'] ?? '',
      area: json['Area'] ?? '',
      dob:
          json['DOB'] is int
              ? json['DOB']
              : int.tryParse(json['DOB'].toString()) ?? 0,
      name: json['name'] ?? '',
      office: json['office'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'password': password,
    'Area': area,
    'DOB': dob,
    'name': name,
    'office': office,
    'email': email,
  };
}
