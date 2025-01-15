import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, onPrimary: Colors.black, onError: Colors.red),
        fontFamily: "IBMPlexSansThai",
        fontFamilyFallback: const ["IBMPlexSansThai"],
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      routes: Routes.build,
    );
  }
}