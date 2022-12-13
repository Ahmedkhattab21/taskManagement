

class LoginModel{
  String status;
  UserData? user;
  String verify;
  UserAuthorisation authorisation;
  LoginModel({required this.status,
     this.user,
    required this.verify,
    required this.authorisation});

  factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel(status: json['status'],
        user: UserData.fromJson(json['user'] == null ? null :json['user'] ),
        verify: json['verify'],
        authorisation: UserAuthorisation.fromJson(json['authorisation']));
  }
}

class UserData{
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String phone;
  dynamic googleId;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
     this.googleId,
  });

 factory UserData.fromJson(Map<String,dynamic> json){
   return UserData(
       id: json['id'],
       name: json['name'],
       email: json['email'],
       emailVerifiedAt:json['email_verified_at'] ,
       createdAt: DateTime.parse(json['created_at']),
       updatedAt: DateTime.parse(json['updated_at']),
       phone: json['phone'],
     googleId: json['google_id']
   );
  }

}

class UserAuthorisation{
  String token;
  String type;
  UserAuthorisation({required this.token,required this.type});
  factory UserAuthorisation.fromJson(Map<String,dynamic> json){
    return UserAuthorisation(token: json['token'], type: json['type']);
  }
}