import 'package:demoprovider/models/Transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  // List<Transaction> transactions = [
  //   Transaction(title: "หนังสือ", amount: 500, date: DateTime.now()),
  //   Transaction(title: "เสื้อ", amount: 900, date: DateTime.now()),
  //   Transaction(title: "กางเกง", amount: 400, date: DateTime.now()),
  //   Transaction(title: "นาฬิกา", amount: 1400, date: DateTime.now()),
  // ];
  List<Transaction> transactions = [];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    // transactions.add(statement); 
    transactions.insert(0, statement);
    // แจ้งเตือน Consumer ให้เปลี่ยนแปลงข้อมูล
    notifyListeners();
  }

}