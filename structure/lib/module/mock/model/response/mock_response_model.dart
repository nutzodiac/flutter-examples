class MockResponseModel {
    Head? head;
    Body? body;

    MockResponseModel({
        this.head,
        this.body,
    });

    factory MockResponseModel.fromJson(Map<String, dynamic> json) => MockResponseModel(
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
    List<ProvinceDetail>? list;

    Body({
        this.result,
        this.resultcode,
        this.reason,
        this.list,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        result: json["result"],
        resultcode: json["resultcode"],
        reason: json["reason"],
        list: json["list"] == null ? [] : List<ProvinceDetail>.from(json["list"]!.map((x) => ProvinceDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "resultcode": resultcode,
        "reason": reason,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ProvinceDetail {
    String? provinceLo;
    String? codePro;
    String? provinceEn;

    ProvinceDetail({
        this.provinceLo,
        this.codePro,
        this.provinceEn,
    });

    factory ProvinceDetail.fromJson(Map<String, dynamic> json) => ProvinceDetail(
        provinceLo: json["province_lo"],
        codePro: json["code_pro"],
        provinceEn: json["province_en"],
    );

    Map<String, dynamic> toJson() => {
        "province_lo": provinceLo,
        "code_pro": codePro,
        "province_en": provinceEn,
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