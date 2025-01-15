import 'package:flutter/material.dart';
import 'package:foodies/components/text/textlabel.dart';

import '../../../routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 5), () {
        if (mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(Routes.mainmenu, (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.cover
          ),
        ),        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Bright_Yellow_Tree_Icon_Landscaping_Logo__1_-removebg-preview.png', width: 140),
              Textlabel.custom(
                text: "Foodies",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                color: Colors.yellow.shade700,
                fontSize: 32,
              )
            ],
          )
        ),
      ),
    );
  }
}