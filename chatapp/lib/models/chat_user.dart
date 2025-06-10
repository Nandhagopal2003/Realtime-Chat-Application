class ChatApp {
  ChatApp({
    required this.password,
    required this.Area,
    required this.DOB,
    required this.name,
    required this.office,
    required this.email,
  });
  late final String password;
  late final String Area;
  late final int DOB;
  late final String name;
  late final String office;
  late final String email;
  
  ChatApp.fromJson(Map<String, dynamic> json){
    password = json['password'];
    Area = json['Area'];
    DOB = json['DOB'];
    name = json['name'];
    office = json['office'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['password'] = password;
    _data['Area'] = Area;
    _data['DOB'] = DOB;
    _data['name'] = name;
    _data['office'] = office;
    _data['email'] = email;
    return _data;
  }
}