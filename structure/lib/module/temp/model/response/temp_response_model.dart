class TempResponseModel {
    Head? head;
    Body? body;

    TempResponseModel({
        this.head,
        this.body,
    });

    factory TempResponseModel.fromJson(Map<String, dynamic> json) => TempResponseModel(
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

    Body({
        this.result,
        this.resultcode,
        this.reason,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        result: json["result"],
        resultcode: json["resultcode"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "resultcode": resultcode,
        "reason": reason,
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