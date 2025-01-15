class LoginResponseModel {
    Head? head;
    Body? body;

    LoginResponseModel({
        this.head,
        this.body,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        head: json["head"] == null ? null : Head.fromJson(json["head"]),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "head": head?.toJson(),
        "body": body?.toJson(),
    };
}

class Body {
    String? result;
    String? resultcode;
    String? reason;
    String? token;
    String? profileName;
    String? promotionflag;

    Body({
        this.result,
        this.resultcode,
        this.reason,
        this.token,
        this.profileName,
        this.promotionflag,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        result: json["result"],
        resultcode: json["resultcode"],
        reason: json["reason"],
        token: json["token"],
        profileName: json["profile_name"],
        promotionflag: json["promotionflag"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "resultcode": resultcode,
        "reason": reason,
        "token": token,
        "profile_name": profileName,
        "promotionflag": promotionflag,
    };
}

class Head {
    String? errorflag;
    String? errorcode;
    String? errordesc;

    Head({
        this.errorflag,
        this.errorcode,
        this.errordesc,
    });

    factory Head.fromJson(Map<String, dynamic> json) => Head(
        errorflag: json["errorflag"],
        errorcode: json["errorcode"],
        errordesc: json["errordesc"],
    );

    Map<String, dynamic> toJson() => {
        "errorflag": errorflag,
        "errorcode": errorcode,
        "errordesc": errordesc,
    };
}
