class LoginRequestModel {
    String? username;
    String? password;
    String? ip;
    String? device;

    LoginRequestModel({
        this.username,
        this.password,
        this.ip,
        this.device,
    });

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        username: json["username"],
        password: json["password"],
        ip: json["ip"],
        device: json["device"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "ip": ip,
        "device": device,
    };
}
