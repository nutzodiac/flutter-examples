class CashWithdrawRequestModel {
  String? pin;
  String? txcash;
  String? bankacc;
  String? bankbranchcode;
  String? bankcode;
  String? remark;

  CashWithdrawRequestModel(
      {this.pin,
      this.txcash,
      this.bankacc,
      this.bankbranchcode,
      this.bankcode,
      this.remark});

  CashWithdrawRequestModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    txcash = json['txcash'];
    bankacc = json['bankacc'];
    bankbranchcode = json['bankbranchcode'];
    bankcode = json['bankcode'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['txcash'] = txcash;
    data['bankacc'] = bankacc;
    data['bankbranchcode'] = bankbranchcode;
    data['bankcode'] = bankcode;
    data['remark'] = remark;
    return data;
  }
}
