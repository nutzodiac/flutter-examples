import 'package:demoprovider/models/Transaction.dart';
import 'package:demoprovider/providers/TransactionProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  FormScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แบบฟอร์มบันทึกข้อมูล'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ชื่อรายการ'),
                autofocus: true,
                controller: titleController,
                validator: (String? str) {
                  if (str!.isEmpty) {
                    return "กรุณาป้อนชื่อรายการ";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'จำนวนเงิน'),
                keyboardType: TextInputType.number,
                controller: amountController,
                validator: (String? str) {
                  if (str!.isEmpty) {
                    return "กรุณาป้อนจำนวนเงิน";
                  }
                  if (double.parse(str) <= 0) {
                    return "กรุณาป้อนตัวเลขมากกว่า 0";
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String title = titleController.text;
                    String amount = amountController.text;
                    print(title);
                    print(amount);

                    // เตรียมข้อมูล
                    Transaction statement = Transaction(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now()
                    ); // object

                    // เรียก Provider
                    TransactionProvider provider = Provider.of<TransactionProvider>(context, listen:false);
                    provider.addTransaction(statement);
                    
                    Navigator.pop(context);
                  }
                }, 
                child: const Text('เพิ่มข้อมูล'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}