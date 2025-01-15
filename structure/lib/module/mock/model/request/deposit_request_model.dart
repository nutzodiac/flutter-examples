import 'dart:convert';

DepositRequetModel depositRequetModelFromJson(String str) => DepositRequetModel.fromJson(json.decode(str));

String depositRequetModelToJson(DepositRequetModel data) => json.encode(data.toJson());

class DepositRequetModel {
    String pin;
    String bank;
    String txcash;
    String paytype;
    String device;

    DepositRequetModel({
        required this.pin,
        required this.bank,
        required this.txcash,
        required this.paytype,
        required this.device,
    });

    factory DepositRequetModel.fromJson(Map<String, dynamic> json) => DepositRequetModel(
        pin: json["pin"],
        bank: json["bank"],
        txcash: json["txcash"],
        paytype: json["paytype"],
        device: json["device"],
    );

    Map<String, dynamic> toJson() => {
        "pin": pin,
        "bank": bank,
        "txcash": txcash,
        "paytype": paytype,
        "device": device,
    };
}