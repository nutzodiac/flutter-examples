class CashDepositResponse {
  CashDepositResponse({
    required this.head,
    required this.body,
  });

  Head head;
  Body body;

  factory CashDepositResponse.fromJson(Map<dynamic, dynamic> json) =>
      CashDepositResponse(
        head: Head.fromJson(json["head"]),
        body: Body.fromJson(json["body"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "head": head.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Body({
    required this.result,
    required this.resultcode,
    required this.reason,
    required this.bankurl,
    required this.bankbody,
    required this.symbol,
    required this.username,
    required this.account,
    required this.paymenttype,
    required this.amount,
    required this.custid,
    required this.refno,
    required this.payeeid,
    required this.transactions,
  });

  String result;
  String resultcode;
  String reason;
  String? bankurl;
  Bankbody? bankbody;
  String? symbol;
  String? username;
  String? account;
  String? paymenttype;
  String? amount;
  String? custid;
  String? refno;
  String? payeeid;
  int? transactions;

  factory Body.fromJson(Map<dynamic, dynamic> json) => Body(
        result: json["result"],
        resultcode: json["resultcode"],
        reason: json["reason"],
        bankurl: json["bankurl"],
        bankbody: json["bankbody"] == null ? null : Bankbody.fromJson(json["bankbody"]),
        symbol: json["symbol"],
        username: json["username"],
        account: json["account"],
        paymenttype: json["paymenttype"],
        amount: json["amount"],
        custid: json["custid"],
        refno: json["refno"],
        payeeid: json["payeeid"],
        transactions: json["transactions"],
      );

  Map<dynamic, dynamic> toJson() => {
        "result": result,
        "resultcode": resultcode,
        "reason": reason,
        "bankurl": bankurl,
        "bankbody": bankbody!.toJson(),
        "symbol": symbol,
        "username": username,
        "account": account,
        "paymenttype": paymenttype,
        "amount": amount,
        "custid": custid,
        "refno": refno,
        "payeeid": payeeid,
        "transactions": transactions,
      };
}

class Bankbody {
  Bankbody({
    required this.mid,
    required this.terminal,
    required this.command,
    required this.refNo,
    required this.refDate,
    required this.serviceId,
    required this.custId,
    required this.amount,
    required this.curAbbr,
    required this.custLname,
    required this.custFname,
    required this.custEmail,
    required this.custCountry,
    required this.custAddress1,
    required this.custAddress2,
    required this.custZip,
    required this.backUrl,
  });

  String mid;
  String terminal;
  String command;
  String refNo;
  String refDate;
  String serviceId;
  String custId;
  String amount;
  String curAbbr;
  String custLname;
  String custFname;
  String custEmail;
  String custCountry;
  String custAddress1;
  String custAddress2;
  String custZip;
  String backUrl;

  factory Bankbody.fromJson(Map<dynamic, dynamic> json) => Bankbody(
        mid: json["mid"],
        terminal: json["terminal"],
        command: json["command"],
        refNo: json["ref_no"],
        refDate: json["ref_date"],
        serviceId: json["service_id"],
        custId: json["cust_id"],
        amount: json["amount"],
        curAbbr: json["cur_abbr"],
        custLname: json["cust_lname"],
        custFname: json["cust_fname"],
        custEmail: json["cust_email"],
        custCountry: json["cust_country"],
        custAddress1: json["cust_address1"],
        custAddress2: json["cust_address2"],
        custZip: json["cust_zip"],
        backUrl: json["backURL"],
      );

  Map<dynamic, dynamic> toJson() => {
        "mid": mid,
        "terminal": terminal,
        "command": command,
        "ref_no": refNo,
        "ref_date": refDate,
        "service_id": serviceId,
        "cust_id": custId,
        "amount": amount,
        "cur_abbr": curAbbr,
        "cust_lname": custLname,
        "cust_fname": custFname,
        "cust_email": custEmail,
        "cust_country": custCountry,
        "cust_address1": custAddress1,
        "cust_address2": custAddress2,
        "cust_zip": custZip,
        "backURL": backUrl,
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

  factory Head.fromJson(Map<dynamic, dynamic> json) => Head(
        errorflag: json["errorflag"],
        errorcode: json["errorcode"],
        errordesc: json["errordesc"],
      );

  Map<dynamic, dynamic> toJson() => {
        "errorflag": errorflag,
        "errorcode": errorcode,
        "errordesc": errordesc,
      };
}
