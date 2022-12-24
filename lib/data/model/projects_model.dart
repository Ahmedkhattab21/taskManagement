class ProjectsModel{
  bool status;
  Data data;
  String message;

  ProjectsModel({required this.status,required this.data,required this.message});

  factory ProjectsModel.fromJson(Map<String,dynamic> json){
    return ProjectsModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }
  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data{
  List<ProjectData> projects;
  Data({
    required this.projects,
  });
  factory Data.fromJson(Map<String,dynamic> json){
    return Data(
        projects: List<ProjectData>.from(json['projects'].map((x)=>ProjectData.fromJson(x))),
    );

  }
  Map<String, dynamic> toJson() => {
    "projects": List<ProjectData>.from(projects.map((x) => x.toJson())),
  };
}

class ProjectData{
  int id;
  String title;
  String description;
  DateTime end;
  int status;
  int projectManager;
  DateTime createdAt;
  DateTime updatedAt;
  List<User> users;
  List<Team> teams;

  ProjectData({
    required this.id,
    required this.title,
    required this.description,
    required this.end,
    required this.status,
    required this.projectManager,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
    required this.teams,
  });

  factory ProjectData.fromJson(Map<String,dynamic> json){
    print(888);
    return ProjectData(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        end: DateTime.parse(json['end']),
        status: json['status'],
        projectManager: json['project_manager'],
        createdAt: DateTime.parse( json['created_at']),
        updatedAt: DateTime.parse( json['updated_at']),
        users: List<User>.from(json['users'].map((x)=>User.fromJson(x))),
        teams: List<Team>.from(json['teams'].map((x)=>Team.fromJson(x)))
    );

  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "end": end.toIso8601String(),
    "status": status,
    "project_manager": projectManager,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "users": List<User>.from(users.map((x) => x.toJson())),
    "teams": List<Team>.from(teams.map((x) => x.toJson())),
  };

}

class Team{
  int id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  TeamPivot pivot;
  List<Member> members;

  Team({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.members,
  });

  factory Team.fromJson(Map<String,dynamic> json){
    return Team(
        id: json['id'],
        title: json['title'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt:  DateTime.parse(json['updated_at']),
        pivot:TeamPivot.fromJson(json['pivot']),
        members: List<Member>.from(json['members'].map((x)=>Member.fromJson(x))),
    );
  }

  Map<String,dynamic> toJson()=>{
    "id": id,
    "title": title,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
    "members":List<Member>.from(members.map((e) => e.toJson())),
  };

}

class Member {

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String phone;
  dynamic googleId;
  MemberPivot pivot;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    required this.googleId,
    required this.pivot,
  });

  factory Member.fromJson(Map<String, dynamic> json){
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      phone: json['phone'],
      googleId: json['google_id'],
      pivot: MemberPivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "phone": phone,
        "google_id": googleId,
        "pivot": pivot.toJson(),
      };
}

class MemberPivot{
  int teamId;
  int userId;
  MemberPivot({
    required this.teamId,
    required  this.userId,
  });
  factory MemberPivot.fromJson(Map<String, dynamic> json) {
    return MemberPivot(
      teamId: json['team_id'],
      userId: json['user_id'],
    );
  }
  Map<String,dynamic> toJson()=>{
    "team_id":teamId,
    "user_id":userId,
  };

}

class TeamPivot{
  int projectId;
  int teamId;

  TeamPivot({
    required this.projectId,
    required  this.teamId,
  });

  factory TeamPivot.fromJson(Map<String, dynamic> json) {
    return TeamPivot(
      projectId: json['project_id'],
      teamId: json['team_id'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "project_id":projectId,
    "team_id":teamId
  };
}

class User{
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic phone;
  dynamic googleId;
  UserPivot pivot;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required  this.phone,
    required  this.googleId,
    required this.pivot,
  });

  factory User.fromJson(Map<String,dynamic> json){
     return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        phone: json['phone'],
        googleId: json['google_id'],
        pivot: UserPivot.fromJson(json['pivot']),
    );
  }

  Map<String,dynamic> toJson()=>{
    "id":id,
    "name":name,
    "email":email,
    "email_verified_at":emailVerifiedAt,
    "created_at":createdAt.toIso8601String(),
    "updated_at":updatedAt.toIso8601String(),
    "phone":phone,
    "google_id":googleId,
    "pivot":pivot.toJson(),
  };

  }

class UserPivot{
  int projectId;
  int userId;

  UserPivot({
   required this.projectId,
   required  this.userId,
  });

  factory UserPivot.fromJson(Map<String, dynamic> json) {
    return UserPivot(
        projectId: json['project_id'],
        userId: json['user_id'],
    );
  }
  Map<String,dynamic> toJson()=>{
    "project_id":projectId,
    "user_id":userId
  };
}



