class createProjectRes_model {
  createProjectRes_model({
   required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory createProjectRes_model.fromJson(Map<String, dynamic> json) => createProjectRes_model(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}