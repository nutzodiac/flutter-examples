import 'package:demoprovider/models/Transaction.dart';
import 'package:demoprovider/providers/TransactionProvider.dart';
import 'package:demoprovider/screens/FormScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormScreen()),
            ),
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Consumer(
        builder: (BuildContext context, TransactionProvider provider, Widget? child) {
          // '${provider.transactions.title}'
          int count = provider.transactions.length;
          return count == 0 ? const Center(
            child: Text('ไม่พบข้อมูล', style: TextStyle(fontSize: 40)),
          )
          : ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              Transaction data = provider.transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                      child: Text('${data.amount}'),
                    ),
                  ),
                  title: Text('${data.title}'),
                  subtitle: Text('${data.date}'),
                ),
              );
            },
          );
        },        
      )
    );
  }
}
