class CreateTeamModel {
  CreateTeamModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory CreateTeamModel.fromJson(Map<String, dynamic> json) => CreateTeamModel(
    status: json["status"],
    message: json["message"],

  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}


