// To parse this JSON data, do
//
//     final cashWithdrawRequestResponse = cashWithdrawRequestResponseFromJson(jsonString);

import 'dart:convert';

CashWithdrawResponse cashWithdrawRequestResponseFromJson(String str) => CashWithdrawResponse.fromJson(json.decode(str));

String cashWithdrawRequestResponseToJson(CashWithdrawResponse data) => json.encode(data.toJson());

class CashWithdrawResponse {
    CashWithdrawResponse({
        required this.head,
        required this.body,
    });

    Head head;
    Body body;

    factory CashWithdrawResponse.fromJson(Map<String, dynamic> json) => CashWithdrawResponse(
        head: Head.fromJson(json["head"]),
        body: Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "head": head.toJson(),
        "body": body.toJson(),
    };
}

class Body {
    Body({
        required this.result,
        required this.resultcode,
        required this.reason,
        required this.amount,
        required this.paymenttype,
        required this.transactions,
    });

    String result;
    String resultcode;
    String reason;
    String? amount;
    String? paymenttype;
    int? transactions;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        result: json["result"],
        resultcode: json["resultcode"],
        reason: json["reason"],
        amount: json["amount"],
        paymenttype: json["paymenttype"],
        transactions: json["transactions"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "resultcode": resultcode,
        "reason": reason,
        "amount": amount,
        "paymenttype": paymenttype,
        "transactions": transactions,
    };
}

class Head {
    Head({
        required this.errorflag,
        required this.errorcode,
        required this.errordesc,
    });

    String errorflag;
    String errorcode;
    String errordesc;

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
