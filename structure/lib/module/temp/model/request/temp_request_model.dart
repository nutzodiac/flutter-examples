class TempRequestModel {
    String? username;
    String? password;

    TempRequestModel({
        this.username,
        this.password,
    });

    factory TempRequestModel.fromJson(Map<String, dynamic> json) => TempRequestModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}