class ForgotPasswordRequestModel {
    String email;

    ForgotPasswordRequestModel({
        required this.email,
    });

    factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) => ForgotPasswordRequestModel(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
