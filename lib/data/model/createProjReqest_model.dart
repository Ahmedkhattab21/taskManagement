
class createProjReqest_model {
  createProjReqest_model({
  required  this.title,
   required this.dueDate,
  required  this.description,
  required  this.member,
  });

  String title;
  String dueDate;
  String description;
  Member member;

  factory createProjReqest_model.fromJson(Map<String, dynamic> json) => createProjReqest_model(
    title: json["title"],
    dueDate: json["dueDate"],
    description: json["description"],
    member: Member.fromJson(json["member"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "dueDate": dueDate,
    "description": description,
    "member": member.toJson(),
  };
}

class Member {
  Member({
   required this.teams,
    required this.users,
  });

  List<int> teams;
  List<int> users;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    teams: List<int>.from(json["teams"].map((x) => x)),
    users: List<int>.from(json["users"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "teams": List<dynamic>.from(teams.map((x) => x)),
    "users": List<dynamic>.from(users.map((x) => x)),
  };
}
